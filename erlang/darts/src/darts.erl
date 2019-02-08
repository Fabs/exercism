-module(darts).

-export([score/2]).

score(X,Y) -> score(X*X + Y*Y).
score(D) when D =< 1 -> 10;
score(D) when D =< 25 -> 5;
score(D) when D =< 100 -> 1;
score(_) -> 0.
