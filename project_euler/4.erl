
% Project Euler, Problem #4

% Find the largest palindrome number made from the product of two
% 3-digit numbers.

-export([main/1]).

main(_) -> 
    Pals = find_pals(),
    io:format("~p~n", [lists:nth(1, lists:reverse(Pals))]).

find_pals() ->
    lists:sort(lists:filter
	       (fun(X) -> is_pal(X) end, 
            lists:map(fun({M,N}) -> M*N end, 
                      [{M,N} || M <- lists:seq(100,999),
                                N <- lists:seq(100,999)]))).

% Return whether a number is a palindrome 

is_pal(X) ->
    X div 100000 rem 10 == X rem 10 andalso         % Place 6 == place 1
    X div 10000  rem 10 == X div 10  rem 10 andalso % Place 5 == place 2
    X div 1000   rem 10 == X div 100 rem 10.        % Place 4 == place 3
