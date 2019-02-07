-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2, union/2]).


add(Elem, Set) -> 
    case contains(Elem, Set) of
        true -> Set;
        false -> [Elem | Set]
    end.

contains(Elem, Set) -> find(Elem, Set).

difference(Set1, Set2) ->
    NotFindInSet = fun(S1) -> not contains(S1, Set2) end,
    lists:filter(NotFindInSet, Set1).

disjoint([], []) -> true;
disjoint(Set1, Set2) ->
    not lists:any(fun is_true/1, set_matches(Set1, Set2)).

empty(Set) -> Set =:= [].

equal(Set1, Set2) ->
    case length(Set1) =:= length(Set2) of
        true -> lists:all(fun is_true/1, set_matches(Set1, Set2));
        false -> false
    end.

from_list(List) -> List.

intersection(Set1, Set2) ->
    lists:filter(exists(Set1), Set2).

subset(Set1, Set2) -> length(difference(Set1, Set2)) =:= 0.

union(Set1, Set2) -> Set1 ++ difference(Set2, Set1).

%%% Internal Methods
find(_Elem, []) -> false;
find(Elem, [S | _Set]) when S =:= Elem -> true;
find(Elem, [_S | Set]) -> find(Elem, Set).

set_matches(Set1, Set2) ->
    case length(Set1) >= length(Set2) of
        true -> lists:map(fun(S1) -> contains(S1, Set2) end, Set1);
        false -> set_matches(Set2, Set1)
    end.

exists(Set) -> fun(E) -> contains(E, Set) end.

is_true(B) -> B =:= true.

%is_false(B) -> B =:= false.
