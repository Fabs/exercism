-module(isogram).

-export([is_isogram/1, test_version/0]).

is_isogram(String) -> not repeats_letter(String, sets:new()).

repeats_letter([], _) -> false;
repeats_letter([C | Cs], Seen) when C >= $A, C =< $Z ->
    repeats_letter([lower_alphabet(C) | Cs], Seen);
repeats_letter([C | Cs], Seen) when C >= $a, C =< $z ->
    case sets:is_element(C,Seen) of
        false -> repeats_letter(Cs, sets:add_element(C,Seen));
        true -> io:fwrite("~p ~n", [Seen]),
                true
    end;
repeats_letter([_C | Cs], Seen) -> repeats_letter(Cs, Seen).

%% simple lower case only works for A-Z
lower_alphabet(C) -> C + 32.

test_version() ->
    1.
