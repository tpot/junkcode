
% Project Euler, Problem #1

% Find the sum of all natural numbers less than 1000 that are
% multiples of 3 or 5.

-export([main/1]).

main([String]) -> io:format("~p~n", [sum_nat(list_to_integer(String))]).

sum_nat(N) when N >= 0 -> sum_nat(N - 1, 0).

sum_nat(0, Sum) -> Sum;
sum_nat(N, Sum) when N rem 3 == 0 -> sum_nat(N - 1, Sum + N);
sum_nat(N, Sum) when N rem 5 == 0 -> sum_nat(N - 1, Sum + N);
sum_nat(N, Sum) -> sum_nat(N - 1, Sum).
