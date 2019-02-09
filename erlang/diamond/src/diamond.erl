-module(diamond).

-export([rows/1]).


rows([L | []]) ->
    Chars = lists:seq($A, L),
    diamond(Chars).

diamond(Cs) ->
    DiamondLetters = diamond_levels(Cs),
    DiamondHalf = length(Cs),
    lists:map(fun(C) -> make_line(C, DiamondHalf) end, DiamondLetters).

diamond_levels(Cs) -> Cs ++ tl(lists:reverse(Cs)).

make_line($A, Size) ->
    Outter = make_spaces(Size - 1),
    Outter ++ "A" ++ Outter;

make_line(C, Size) ->
    Move = C - $A,
    Outter = make_spaces(Size - Move - 1),
    Inner = make_spaces(1 + (Move - 1)*2),
    Cs = [C | []],
    Outter ++ Cs ++ Inner ++ Cs ++ Outter.

make_spaces(N) -> lists:foldl(fun(_, S) -> " " ++ S end, "", lists:seq(1,N)).
