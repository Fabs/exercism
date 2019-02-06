-module(dist_accumulate_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").

dist_accumulate_squares_test() ->
    Fn = fun(Number) -> Number * Number end,
    Ls = [1, 2, 3],
    ?assertEqual([{some, 1}, {some, 4}, {some, 9}], dist_accumulate:accumulate(Fn, Ls)).

dist_accumulate_upcases_test() ->
    Fn = fun(Word) -> string:to_upper(Word) end,
    Ls = string:tokens("hello world", " "),
    ?assertEqual([{some, "HELLO"}, {some, "WORLD"}], dist_accumulate:accumulate(Fn, Ls)).

dist_accumulate_reversed_strings_test() ->
    Fn = fun(Word) -> lists:reverse(Word) end,
    Ls = string:tokens("the quick brown fox etc", " "),
    ?assertEqual([{some, "eht"}, {some, "kciuq"}, {some, "nworb"}, {some, "xof"}, {some, "cte"}], dist_accumulate:accumulate(Fn, Ls)).

dist_accumulate_recursively_test() ->
    Chars = string:tokens("a b c", " "),
    Nums = string:tokens("1 2 3", " "),
    Fn = fun(Char) -> [Char ++ Num || Num <- Nums] end,
    ?assertEqual([{some, ["a1", "a2", "a3"]}, {some, ["b1", "b2", "b3"]}, {some, ["c1", "c2", "c3"]}], dist_accumulate:accumulate(Fn, Chars)).


partial_func("hello") -> "HELLO".

dist_accumulate_with_fallback_test() ->
    Ls = string:tokens("hello world", " "),
    Fn = fun partial_func/1,
    ?assertEqual([{some, "HELLO"}, {none, "world"}], dist_accumulate:accumulate(Fn, Ls)).
