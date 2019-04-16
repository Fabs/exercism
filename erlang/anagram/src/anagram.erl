-module(anagram).

-export([find_anagrams/2]).

find_anagrams(Subject, Candidates) ->
    SubjectLower = string:to_lower(Subject),
    SubjectFreq  = lists:sort(SubjectLower),
    lists:filter(fun (Candidate) ->
        CandidateLower = string:to_lower(Candidate),
        CandidateFreq = lists:sort(CandidateLower),
        SubjectFreq =:= CandidateFreq andalso
            SubjectLower =/= CandidateLower
    end, Candidates).
