-module(triangle).

-export([kind/3]).


kind(A, B, C) when B > A -> kind(B, A, C);
kind(A, B, C) when C > B -> kind(A, C, B);
kind(A, B, C) when A == 0, B == 0, C == 0 -> {error, "all side lengths must be positive"};
kind(A, B, C) when (B + C) =< A ->
    {error, "side lengths violate triangle inequality"};
kind(A, A, A) -> equilateral;
kind(A, A, _) -> isosceles;
kind(_, A, A) -> isosceles;
kind(_, _, _) -> scalene.

