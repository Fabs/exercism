-module(raindrops).

-export([convert/1, primes/1, multiples/2, divisors/1]).

convert(N) -> convert(N, divisors(N)).
convert(N, Divisors) ->
    MaybeNames = lists:map(fun to_name/1, Divisors),
    Names = lists:filter(fun is_list/1, MaybeNames),
    case length(Names) of
        0 -> lists:flatten(io_lib:format("~p", [N]));
        _ -> (lists:foldr(fun(X, Acc) -> X ++ Acc end, "", Names))
    end.

to_name(3) -> "Pling";
to_name(5) -> "Plang";
to_name(7) -> "Plong";
to_name(N) -> N.

%% List all the divisors of number N
divisors(N) ->
    [X || X <- primes(N), N rem X == 0].

% Find all the primes lesser than or equal to N
primes(N) when N =< 1 -> [];
primes(2) -> [2];
primes(N) -> primes(N, lists:seq(2,N), 2).

primes(N, Candidates, P) when P*P >= N -> Candidates;
primes(N, Candidates, P) ->
    Powers = multiples(N, P),
    NMultiples = [X || X <- Candidates, not lists:member(X, Powers)],
    [NextP | _] = lists:dropwhile(fun(X) -> X =< P end, NMultiples),
    primes(N, NMultiples, NextP).

multiples(N, P) -> multiples(N, [], P, P*P).
multiples(N, Multiples, _P, NextP) when NextP > N -> Multiples;
multiples(N, Multiples, P, NextP) -> multiples(N, [NextP | Multiples], P, NextP+P).
