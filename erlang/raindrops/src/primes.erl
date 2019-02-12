-module(primes).

-export([generate/1, multiples/2, divisors/1]).

%% List all the divisors of number N
divisors(N) ->
    [X || X <- generate(N), N rem X == 0].

% Find all the generate lesser than or equal to N
generate(N) when N =< 1 -> [];
generate(2) -> [2];
generate(N) -> generate(N, lists:seq(2,N), 2).

generate(N, Candidates, P) when P*P >= N -> Candidates;
generate(N, Candidates, P) ->
    Powers = multiples(N, P),
    NMultiples = [X || X <- Candidates, not lists:member(X, Powers)],
    [NextP | _] = lists:dropwhile(fun(X) -> X =< P end, NMultiples),
    generate(N, NMultiples, NextP).

multiples(N, P) -> multiples(N, [], P, P*P).
multiples(N, Multiples, _P, NextP) when NextP > N -> Multiples;
multiples(N, Multiples, P, NextP) -> multiples(N, [NextP | Multiples], P, NextP+P).
