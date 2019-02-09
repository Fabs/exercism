-module(queen_attack).

-export([can_attack/2]).

can_attack({Wx, _}, {Bx, _}) when Wx =:= Bx -> true;
can_attack({_, Wy}, {_, By}) when Wy =:= By -> true;
can_attack({Wx, Wy}, {Bx, By}) when Wx - Wy =:= Bx - By -> true;
can_attack({Wx, Wy}, {Bx, By}) when Wx + Wy =:= Bx + By -> true;
can_attack(_, _) -> false.
