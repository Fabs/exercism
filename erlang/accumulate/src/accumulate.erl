-module(accumulate).

-export([accumulate/2]).

accumulate(Fn, Ls) ->
  lists:map(Fn, Ls).
