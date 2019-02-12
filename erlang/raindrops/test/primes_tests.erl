-module(primes_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").

'1_powers_generato_2_test'() ->
    ?assertEqual([14, 12, 10, 8, 6, 4], primes:multiples(14, 2)).

'2_powers_generator_3_test'() ->
    ?assertEqual([18, 15, 12, 9], primes:multiples(20, 3)).

'1_divisors_43230_test'() ->
    ?assertEqual([2,3,5,11,131], primes:divisors(43230)).

'2_divisors_131_test'() ->
    ?assertEqual([131], primes:divisors(131)).

'1_sieve_erastostenes_test'() ->
    ?assertEqual([2, 3, 5, 7, 11, 13, 17, 19, 23, 29], primes:generate(29)).
