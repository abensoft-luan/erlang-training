%%%-------------------------------------------------------------------
%%% @author luan
%%% @copyright (C) 2025, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. ago. 2025 11:48
%%%-------------------------------------------------------------------
-module(luan_gerenciador_veiculos).
-author("luan").

%% API
-export([]).
-export([testar_tupla/0, testar_record/0]).
-export([cria_veiculo_tupla/3, cria_veiculo_record/3]).
-export([get_color_tupla/1]).
-export([update_year_tupla/2, update_year_record/2]).
-export([merge_vehicles_tupla/2]).
-export([merge_tuple_values/2]).

-record(carro,
  {
    modelo,
    ano,
    cor
  }).

% Tupla
testar_tupla() ->
  T1 = cria_veiculo_tupla("Chevette", 2015, "Vermelho"),
  T2 = cria_veiculo_tupla("Corola", 2015, "Azul"),
get_color_tupla(T1),
T_updated = update_year_tupla(T1, 2020),
merge_vehicles_tupla(T1, T2).

cria_veiculo_tupla(Modelo, Ano, Cor) ->
  {Modelo, Ano, Cor}.

get_color_tupla(T) ->
{_, _, Cor} = T,
Cor.

update_year_tupla(T, Newyear) ->
{Modelo, _, Cor} = T,
{Modelo, Newyear, Cor}.

merge_vehicles_tupla(T1, T2) ->
{M1, A1, C1} = T1,
{M2, A2, C2} = T2,

M = merge_tuple_values(M1,M2),
A = merge_tuple_values(A1,A2),
C = merge_tuple_values(C1,C2),

{M, A, C}.

% Record
testar_record() ->
  R1 = cria_veiculo_record("Chevette", 2015, "Vermelho"),
  R2 = cria_veiculo_record("Corola", 2015, "Azul"),
  get_color_record(R1),
  update_year_record(R1, 2020).
  %merge_vehicles_record(T1, T2).

cria_veiculo_record(Modelo, Ano, Cor) ->
  #carro
  {
    modelo = Modelo,
    ano = Ano,
    cor = Cor
  }.

get_color_record(R) ->
  R#carro.cor.

update_year_record(R, NewYear) ->
  #carro
  {
    modelo = R#carro.modelo,
    ano = newYear,
    cor = R#carro.cor
  }.


% Auxiliares

merge_tuple_values(A,B) when A == B ->
  {A};
merge_tuple_values(A,B) ->
  {A, B}.