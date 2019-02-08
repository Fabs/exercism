-module(diamond).

-export([rows/1]).


rows([L | []]) ->
    Chars = list:seq($A, L),
    Diamond = diamond(Chars),
    io:fwrite("~p", Diamond).

diamond(Cs) ->
    Piramid = piramid(Cs),
    MainLine = mainLine(Cs),
    Piramid ++ MainLine ++ lists:reverse(Piramid).

piramid(_Cs) -> "".
mainLine(_Cs) -> "".
