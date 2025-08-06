%%%-------------------------------------------------------------------
%%% @author luan
%%% @copyright (C) 2025, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. ago. 2025 10:04
%%%-------------------------------------------------------------------
-module(luan_2nd).
-author("luan").

%% API
-export([]).
-export([maiorque5/0, maiorque5/1]).
-export([filtrar/0, filtrar/2]).
-export([menor/0, menor/1, menor/2]).
-export([membro/1, membro/2]).
-export([substituir/2, substituir/4]).
-export([encontrar_pares/0, encontrar_pares/2]).
-export([intercalar/0, intercalar/3]).

% Contar Elementos de uma Lista que sejam maiores que 5
maiorque5() ->
  maiorque5([7,2,3,5,10]).

maiorque5([]) ->
  0;
maiorque5([Head|Tail]) when Head > 5 ->
  maiorque5(Tail) + 1;
maiorque5([Head|Tail]) when Head =< 5 ->
  maiorque5(Tail).

menor() ->
  menor([1,2,5,10,4]).

menor([Head|Tail]) ->
  menor(Head, Tail).

menor(Small, []) ->
  Small;
menor(Small, [Head|Tail]) when Small > Head ->
  menor(Small, Tail);
menor(Small, [Head|Tail]) when Small =< Head ->
  menor(Head, Tail).

% Filtrar Elementos de uma Lista
filtrar() ->
  filtrar ([1,2,3,4,5,6], fun(N) -> N rem 3 /= 0 end).

filtrar(L, Func) ->
  lists:filter(Func, L).

% Membro da Lista
membro(N) ->
  membro(N, [1,2,3,4,5]).

membro(_, []) ->
  io:format("não pertence~n");
membro(N, [Head|_]) when N == Head->
  io:format("pertence~n");
membro(N, [_|Tails]) ->
  membro(N, Tails).

% Substituir um Elemento em uma Lista
substituir(Hitman, Target) ->
  substituir(Hitman, Target, [1,2,3,1,2,3], []).

substituir(_, _, [], Acc) ->
  lists:reverse(Acc);
substituir(Hitman, Target, [Head|Tail], Acc) when Head == Target->
  substituir(Hitman, Target, Tail, [Hitman | Acc]);
substituir(Hitman, Target, [Head|Tail], Acc)->
  substituir(Hitman, Target, Tail, [Head | Acc]).

% Encontrar Todos os Pares em uma Lista
encontrar_pares() ->
  encontrar_pares([1,2,3,4,5,6], []).

encontrar_pares([], Acc) ->
  lists:reverse(Acc);
encontrar_pares([Head|Tail], Acc) when Head rem 2 == 0 ->
  encontrar_pares(Tail, [Head | Acc]);
encontrar_pares([_|Tail], Acc) ->
  encontrar_pares(Tail, Acc).

%Intercalar Duas Listas
intercalar() ->
  intercalar([1,3,5,7], [2,4,6,8,9], []).

intercalar([],[],Acc) ->
  lists:reverse(Acc);
intercalar([], [Head|Tail], Acc)->
  intercalar([], Tail, [Head | Acc]);
intercalar([Head | Tail], L, Acc)->
  intercalar(L, Tail, [Head | Acc]).

