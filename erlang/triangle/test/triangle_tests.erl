%% Based on canonical data version 1.2.0
%% https://github.com/exercism/problem-specifications/raw/master/exercises/triangle/canonical-data.json
%% This file is automatically generated from the exercises canonical data.

-module(triangle_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").




'1_equilateral_true_if_all_sides_are_equal_test'() ->
    ?assertMatch(equilateral, triangle:kind(2, 2, 2)).

'2_equilateral_all_zero_sides_are_illegal_so_the_triangle_is_not_equilateral_test'() ->
    ?assertMatch({error,
		  "all side lengths must be positive"},
		 triangle:kind(0, 0, 0)).

'3_equilateral_sides_may_be_floats_test'() ->
    ?assertMatch(equilateral,
		 triangle:kind(5.0e-1, 5.0e-1, 5.0e-1)).

'4_isosceles_true_if_last_two_sides_are_equal_test'() ->
    ?assertMatch(isosceles, triangle:kind(3, 4, 4)).

'5_isosceles_true_if_first_two_sides_are_equal_test'() ->
    ?assertMatch(isosceles, triangle:kind(4, 4, 3)).

'6_isosceles_true_if_first_and_last_sides_are_equal_test'() ->
    ?assertMatch(isosceles, triangle:kind(4, 3, 4)).

'7_isosceles_sides_that_violate_triangle_inequality_are_not_isosceles_even_if_two_are_equal_1_test'() ->
    ?assertMatch({error,
		  "side lengths violate triangle inequality"},
		 triangle:kind(1, 1, 3)).

'8_isosceles_sides_that_violate_triangle_inequality_are_not_isosceles_even_if_two_are_equal_2_test'() ->
    ?assertMatch({error,
		  "side lengths violate triangle inequality"},
		 triangle:kind(1, 3, 1)).

'9_isosceles_sides_that_violate_triangle_inequality_are_not_isosceles_even_if_two_are_equal_3_test'() ->
    ?assertMatch({error,
		  "side lengths violate triangle inequality"},
		 triangle:kind(3, 1, 1)).

'10_isosceles_sides_may_be_floats_test'() ->
    ?assertMatch(isosceles,
		 triangle:kind(5.0e-1, 4.0e-1, 5.0e-1)).

'11_scalene_true_if_no_sides_are_equal_test'() ->
    ?assertMatch(scalene, triangle:kind(5, 4, 6)).

'12_scalene_sides_that_violate_triangle_inequality_are_not_scalene_even_if_they_are_all_different_test'() ->
    ?assertMatch({error,
		  "side lengths violate triangle inequality"},
		 triangle:kind(7, 3, 2)).

'13_scalene_sides_may_be_floats_test'() ->
    ?assertMatch(scalene,
		 triangle:kind(5.0e-1, 4.0e-1,
			       5.99999999999999977796e-1)).
