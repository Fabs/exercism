-module(collatz_conjecture).

-export([steps/1]).

steps(N) -> steps(0, N).
steps(S, 1) -> S;
steps(_S, N) when N =< 0 -> {error, "Only positive numbers are allowed"};
steps(S, N) when N rem 2 =:= 0 -> steps(S + 1, N div 2);
steps(S, N) -> steps(S + 1, 3*N + 1).
