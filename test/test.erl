%%%-------------------------------------------------------------------
%%% @author kamotora
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. март 2021 21:38
%%%-------------------------------------------------------------------
-module(test).
-author("kamotora").

-include_lib("eunit/include/eunit.hrl").
-import(main, [hanoi/1]).

hanoi1_test() ->
  util:print("hanoi1_test"),
  ?assertEqual(#{1 => [], 2 => [], 3 => [1]}, hanoi(1)).
hanoi3_test() ->
  util:print("hanoi3_test"),
  ?assertEqual(#{1 => [], 2 => [], 3 => [1, 2, 3]}, hanoi(3)).
hanoi10_test() ->
  util:print("hanoi10_test"),
  ?assertEqual(#{1 => [], 2 => [], 3 => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}, hanoi(10)).
incorrect_hanoi_test() ->
  util:print("incorrect_hanoi_test"),
  ?assertThrow(error, hanoi(-1)).
