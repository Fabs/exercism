-module(difference_of_squares).

-export([sum_of_squares/1, square_of_sum/1, difference_of_squares/1, test_version/0]).

%% Naive solution O(N) memory and space
%% sum_of_squares(0) -> 0;
%% sum_of_squares(N) ->
    %% Ns = lists:seq(1,N),
    %% Squares = lists:map(fun(X) -> X * X end, Ns),
    %% lists:sum(Squares).
sum_of_squares(N) -> N * (N + 1) * (2*N + 1) div 6.

%% Naive solution O(N) memory and space
%% square_of_sum(0) -> 0;
%% square_of_sum(N) ->
    %% Ns = lists:seq(1,N),
    %% SumN = lists:sum(Ns),
    %% SumN * SumN.
square_of_sum(N) ->
    Sum = N * (N + 1) div 2,
    Sum * Sum.

difference_of_squares(N) ->
    square_of_sum(N) - sum_of_squares(N).

test_version() -> 1.
