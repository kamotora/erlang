%%%-------------------------------------------------------------------
%%% @author kamotora
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. март 2021 21:28
%%%-------------------------------------------------------------------
-module(util).
-author("kamotora").

%% API
-export([seq/1, print/1, reverse/1, printAndReturn/1]).

seq(1) -> [1];
seq(N) -> seq(N - 1) ++ [N].

% Print Val in console
print(Val) -> erlang:display(Val).
printAndReturn(Val) -> erlang:display(Val), Val.

reverse(L) -> reverse(L, []).
reverse([], R) -> R;
reverse([H | T], R) -> reverse(T, [H | R]).