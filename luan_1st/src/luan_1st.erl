%%%-------------------------------------------------------------------
%%% @author luan
%%% @copyright (C) 2025, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. ago. 2025 16:52
%%%-------------------------------------------------------------------
-module(luan_1st).
-author("luan").

-export([fatorial/1]).
-export([comprimento/0, comprimento/1]).
-export([fibonacci/1, fibonacci/3]).
-export([maior/0, maior/1, maior/2]).
-export([par/1]).
-export([concatena/0, concatena/2]).
-export([inverte/0, inverte/1, inverte2/0, inverte2/2]).
-export([duplica/0, duplica/2]).

% Fatorial
fatorial(1) ->
    1;
fatorial(N) ->
    fatorial(N-1) * N.

% Comprimento de uma Lista
comprimento() ->
    comprimento(    [1,2,3,4,5,6]).

comprimento([]) ->
    0;
comprimento([_|Tail]) ->
    comprimento(Tail) + 1.

% Fibonacci
fibonacci(N) ->
    fibonacci(N-2, 0, 1).

fibonacci(0, _, B) ->
    B;
fibonacci(N, A, B) ->
    fibonacci(N-1, B, A+B).

% Maior elemento da Lista
maior() ->
    maior([1,2,5,10,4]).

maior([Head|Tail]) ->
    maior(Head, Tail).

maior(Big, []) ->
    Big;
maior(Big, [Head|Tail]) when Big > Head ->
    maior(Big, Tail);
maior(Big, [Head|Tail]) when Big =< Head ->
    maior(Head, Tail).

% Verificar se um Número é Par
par(N) when N rem 2 == 0 ->
    io:format("par~n");
par(_) ->
    io:format("ímpar~n").

% Concatenar Duas Listas
concatena() ->
    concatena([2,3,4], [1,2,3]).

concatena(A, B) ->
    A ++ B.

% Reverter uma Lista
inverte() ->
    inverte([1,2,3,4,5]).

inverte(L) ->
    lists:reverse(L).

inverte2() ->
    inverte2([1,2,3,4,5], []).

inverte2([], Acc) ->
    Acc;
inverte2([Head|Tail], Acc) ->
    inverte2(Tail, [Head | Acc]).

% Duplicar os Elementos de uma Lista
duplica() ->
    duplica([1,2,3,4,5], []).

duplica([], Acc) ->
    Acc;
duplica([Head|Tail], Acc) ->
    duplica(Tail, [Head | [Head | Acc]]).

