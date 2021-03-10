%%%-------------------------------------------------------------------
%%% @author kamotora
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. март 2021 20:54
%%%-------------------------------------------------------------------
-module(main).
-author("kamotora").

%% API
-export([demo/0, hanoi/1]).

demo() -> hanoi(3).

hanoi(N) ->
  hanoi(N, 1, 3).

createTowers(N) ->
  #{1 => util:seq(N), 2 => [], 3 => []}.

hanoi(N, _, _) when N < 1 ->
  throw(error);

hanoi(N, From, To) when N >= 1 ->
  hanoi(N, util:printAndReturn(createTowers(N)), From, To).

hanoi(N, Towers, From, To) ->
  move(N, Towers, From, To).

move(1, Towers, From, To) ->
  [H | NewFrom] = maps:get(From, Towers),
  util:printAndReturn(Towers#{From => NewFrom, To => [H | maps:get(To, Towers)]});

move(N, Towers, From, To) ->
  Towers1 = move(N - 1, Towers, From, buf(From, To)),
  Towers2 = move(1, Towers1, From, To),
  move(N - 1, Towers2, buf(From, To), To).

buf(From, To) when From == To -> throw("Error! From should be != To");
buf(From, To) -> 6 - From - To.

%%move(Disk, [Disk | From], To, Buf) ->
%%  util:printAndReturn([From, [Disk | To], Buf]);
%%
%%move(Disk, From, To, Buf) ->
%%  [From1, Buf1, To1] = move(Disk - 1, From, Buf, To),
%%  [From2, To2, Buf2] = move(Disk, From1, To1, Buf1),
%%  [Buf3, To3, From3] = move(Disk - 1, Buf2, To2, From2),
%%  [From3, To3, Buf3].