%%%-------------------------------------------------------------------
%% @doc luan_gerenciador_veiculos public API
%% @end
%%%-------------------------------------------------------------------

-module(luan_gerenciador_veiculos_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    luan_gerenciador_veiculos_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
