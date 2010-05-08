
% Project Euler, Problem #3

% Find the largest prime factor of 317584931803.

-export([main/1]).

main(_) -> 
    F = prime_factors(317584931803),
    io:format("~p~n", [lists:nth(1, lists:reverse(F))]).

% Return whether X is a factor of Num

isfactor(X, Num) -> 
    Num rem X == 0.

% Return whether Num is prime using sqrt(n) primality test

isprime(Num) when Num rem 2 == 0 -> 
    false;

isprime(Num) -> 
    not lists:any(fun(X) -> 
                          isfactor(X, Num) 
                  end,
			      lists:seq(3, round(math:sqrt(Num)), 2)).

% Return a list of prime factors for Num

prime_factors(Num) ->
    lists:filter(fun(X) -> 
                         isfactor(X, Num) andalso isprime(X) 
                 end, 
                 lists:seq(3, round(math:sqrt(Num)), 2)).
