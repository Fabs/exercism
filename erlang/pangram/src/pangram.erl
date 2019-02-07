-module(pangram).

-export([is_pangram/1, test_version/0]).
-define(alphabet, "abcdefghijklmnopqrstuvwxyz").

is_pangram(Sentence) ->
    AlphabetSet = lowercase_set(?alphabet),
    SentenceSet = lowercase_set(Sentence),
    sets:is_subset(AlphabetSet, SentenceSet).

lowercase_set(Letters) ->
    LowerCaseLetters = string:lowercase(Letters),
    sets:from_list(LowerCaseLetters).

test_version() -> 1.
