
% Project Euler, Problem #2

% Return sum of even-valued terms of the Fibonnaci sequence which do
% not exceed one million.

-export([main/1]).

main(_) -> io:format("~p~n", [sum_fib(1000000)]).

sum_fib(Max) -> sum_fib(1, 2, Max, 0).

sum_fib(N, M, Max, Sum) when M =< Max -> 
    sum_fib(M, N + M, Max, Sum + N * (1 - N rem 2));

sum_fib(N, _, _, Sum) -> Sum + N * (1 - N rem 2).
