-module(roman_numerals).

-export([roman/1, fromRoman/1]).

roman(Number) ->
     romans(Number).

fromRoman(Number) ->
    Reverse = lists:reverse(Number),
    {Sum, _}= lists:foldl(fun number_positional/2, {0, $Z}, Reverse),
    Sum.

number_positional(C, {S, L}) ->
    case numerals(C) >= numerals(L) of
        true -> {numerals(C) + S, C};
        false -> {-1*numerals(C) + S, L}
    end.

numerals($M) -> 1000;
numerals($D) -> 500;
numerals($C) -> 100;
numerals($L) -> 50;
numerals($X) -> 10;
numerals($V) -> 5;
numerals($I) -> 1;
numerals($Z) -> 0.

romans(1000) -> "M";
romans(900) -> "CM";
romans(500) -> "D";
romans(400) -> "CD";
romans(100) -> "C";
romans(90) -> "XC";
romans(50) -> "L";
romans(40) -> "XL";
romans(10) -> "X";
romans(9) -> "IX";
romans(5) -> "V";
romans(4) -> "IV";
romans(1) -> "I".
