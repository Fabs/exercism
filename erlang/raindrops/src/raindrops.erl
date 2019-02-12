-module(raindrops).
-import(primes, [divisors/1]).

-export([convert/1]).

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
