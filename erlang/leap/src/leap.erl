-module(leap).

-export([leap_year/1, test_version/0]).

leap_year(InvalidYear) when InvalidYear < 0 -> false;
leap_year(Year) ->
    DivisibleBy4 = is_divisible(4, Year),
    DivisibleBy100 = is_divisible(100, Year),
    DivisibleBy400 = is_divisible(400, Year),
    is_leap_year(DivisibleBy4, DivisibleBy100, DivisibleBy400).

is_divisible (Divisor, Dividend) -> Dividend rem Divisor =:= 0.

is_leap_year(true, false, _) -> true;
is_leap_year(true, true, true) -> true;
is_leap_year(_, _, _) -> false.

test_version() -> 4.
