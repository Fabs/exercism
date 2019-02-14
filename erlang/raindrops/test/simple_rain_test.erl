%% Based on canonical data version 1.1.0
%% https://github.com/exercism/problem-specifications/raw/master/exercises/simple_rain/canonical-data.json
%% This file is automatically generated from the exercises canonical data.

-module(simple_rain_test).

-include_lib("eunit/include/eunit.hrl").

'1_the_sound_for_1_is_1_test'() ->
    ?assertEqual("1", simple_rain:convert(1)).

'2_the_sound_for_3_is_pling_test'() ->
    ?assertEqual("Pling", simple_rain:convert(3)).

'3_the_sound_for_5_is_plang_test'() ->
    ?assertEqual("Plang", simple_rain:convert(5)).

'4_the_sound_for_7_is_plong_test'() ->
    ?assertEqual("Plong", simple_rain:convert(7)).

'5_the_sound_for_6_is_pling_as_it_has_a_factor_3_test'() ->
    ?assertEqual("Pling", simple_rain:convert(6)).

'6_2_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base_test'() ->
    ?assertEqual("8", simple_rain:convert(8)).

'7_the_sound_for_9_is_pling_as_it_has_a_factor_3_test'() ->
    ?assertEqual("Pling", simple_rain:convert(9)).

'8_the_sound_for_10_is_plang_as_it_has_a_factor_5_test'() ->
    ?assertEqual("Plang", simple_rain:convert(10)).

'9_the_sound_for_14_is_plong_as_it_has_a_factor_of_7_test'() ->
    ?assertEqual("Plong", simple_rain:convert(14)).

'10_the_sound_for_15_is_pling_plang_as_it_has_factors_3_and_5_test'() ->
    ?assertEqual("PlingPlang", simple_rain:convert(15)).

'11_the_sound_for_21_is_pling_plong_as_it_has_factors_3_and_7_test'() ->
    ?assertEqual("PlingPlong", simple_rain:convert(21)).

'12_the_sound_for_25_is_plang_as_it_has_a_factor_5_test'() ->
    ?assertEqual("Plang", simple_rain:convert(25)).

'13_the_sound_for_27_is_pling_as_it_has_a_factor_3_test'() ->
    ?assertEqual("Pling", simple_rain:convert(27)).

'14_the_sound_for_35_is_plang_plong_as_it_has_factors_5_and_7_test'() ->
    ?assertEqual("PlangPlong", simple_rain:convert(35)).

'15_the_sound_for_49_is_plong_as_it_has_a_factor_7_test'() ->
    ?assertEqual("Plong", simple_rain:convert(49)).

'16_the_sound_for_52_is_52_test'() ->
    ?assertEqual("52", simple_rain:convert(52)).

'17_the_sound_for_105_is_pling_plang_plong_as_it_has_factors_3_5_and_7_test'() ->
    ?assertEqual("PlingPlangPlong", simple_rain:convert(105)).

'18_the_sound_for_3125_is_plang_as_it_has_a_factor_5_test'() ->
    ?assertEqual("Plang", simple_rain:convert(3125)).