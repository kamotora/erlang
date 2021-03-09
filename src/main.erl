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
-export([demo/0]).

demo() -> util:print(hanoi(10)).

hanoi(N) ->
  Init = createTowers(N),
  util:print(Init),
  hanoi(N, util:seq(N), [], []).

createTowers(N) ->
  [util:seq(N), [], []].

hanoi(N, A, B, C) ->
  move(N, A, B, C).

move(Disk, [Disk | From], To, Buf) ->
  [From, [Disk | To], Buf];

move(Disk, From, To, Buf) ->
  [From1, Buf1, To1] = move(Disk - 1, From, Buf, To),
  [From2, To2, Buf2] = move(Disk, From1, To1, Buf1),
  [Buf3, To3, From3] = move(Disk - 1, Buf2, To2, From2),
  [From3, To3, Buf3].