-module(roman_numerals).

-export([roman/1, fromRoman/1]).
-define(ROMANS, [
  {"M", 1000},
  {"CM", 900},
  {"D",  500},
  {"CD", 400},
  {"C",  100},
  {"XC",  90},
  {"L",   50},
  {"XL",  40},
  {"X",   10},
  {"IX",   9},
  {"V",    5},
  {"IV",   4},
  {"I",    1}
]).

roman(Number) when Number =< 0 -> {error, "Only positive numbers are allowed"};
roman(Number) -> roman(Number, "").
roman(0, RomanAcc) -> RomanAcc;
roman(Number, RomanAcc) ->
    Pred = fun({_, N}) -> Number < N end,
    [{RomanNumber ,NextNumber}| _ ] = lists:dropwhile(Pred, ?ROMANS),
    roman(Number - NextNumber,RomanAcc ++ RomanNumber).


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
