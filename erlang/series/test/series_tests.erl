-module(series_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").

three_test() -> ?assertEqual(["012", "123", "234"], series:from_string(3, "01234")).

four_test() -> ?assertEqual(["0123", "1234"], series:from_string(4, "01234")).

more_test() -> ?assertEqual(["01234"], series:from_string(5,"01234")).

version_test() ->
  ?assertMatch(1, series:test_version()).
