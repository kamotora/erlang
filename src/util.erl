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
-export([seq/1, index_of/2, pretty_print/1, print/1]).

seq(1) -> [1];
seq(N) -> seq(N - 1) ++ [N].

index_of(Item, List) -> index_of(Item, List, 1).

index_of(_, [], _) -> not_found;
index_of(Item, [Item | _], Index) -> Index;
index_of(Item, [_ | Tl], Index) -> index_of(Item, Tl, Index + 1).

% Print Val in console
print(Val) -> erlang:display(Val).
pretty_print([]) -> [];
pretty_print([H | T]) -> print(H), pretty_print(T).