
% Project Euler, Problem #4

% Find the largest palindrome number made from the product of two
% 3-digit numbers.

-export([main/1]).

main(_) -> 
    Pals = find_pals(),
    io:format("~p~n", [lists:nth(1, lists:reverse(Pals))]).

find_pals() ->
    lists:sort(lists:filter
	       (fun(X) -> 
                    is_pal(X) 
            end, 
            lists:map(fun({M,N}) -> M*N end, 
                      [{M,N} || M <- lists:seq(100,999),
                                N <- lists:seq(100,999) -- [M]]))).

% Return whether a number is a palindrome 

is_pal(X) when X < 100 -> 
    place(2, X) == place(1, X);

is_pal(X) when X < 1000 -> 
    place(3, X) == place(1, X);

is_pal(X) when X < 10000 ->
    (place(4, X) == place(1, X)) and
    (place(3, X) == place(2, X));

is_pal(X) when X < 100000 ->
    (place(5, X) == place(1, X)) and
    (place(4, X) == place(2, X));

is_pal(X) when X < 1000000 ->
    (place(6, X) == place(1, X)) and
    (place(5, X) == place(2, X)) and
    (place(4, X) == place(3, X)).

% Return decimal "place" N in number X

place(N, X) ->
    (X div round(math:pow(10, N-1))) rem 10.
