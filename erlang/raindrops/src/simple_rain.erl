-module(simple_rain).

-export([convert/1]).

-define(RAINDROP_DICT,[
    {3, "Pling"},
    {5, "Plang"},
    {7, "Plong"}
]).

convert(N) -> convert(N, raindrops_translation(N)).

convert(N, "") -> integer_to_list(N);
convert(_N, RainDrops) -> RainDrops.

raindrops_translation(N) ->
    Raindrops = [raindrop(N, D, Drop) || {D, Drop} <- ?RAINDROP_DICT],
    lists:flatten(Raindrops).

raindrop(N, D, Drop) when N rem D =:= 0 -> Drop;
raindrop(_, _, _) -> "".
