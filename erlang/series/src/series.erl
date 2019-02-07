-module(series).

-export([from_string/2, test_version/0]).

from_string(N, String) ->
    from_string(N, String, []).

from_string(N, String, Words) ->
  case length(String) > N of
      true -> from_string(N, tl(String), [lists:sublist(String, N) | Words]);
      false -> lists:reverse([String | Words])
  end.

test_version() -> 1.
