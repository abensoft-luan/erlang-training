%%%-------------------------------------------------------------------
%% @doc luan_1st public API
%% @end
%%%-------------------------------------------------------------------

-module(luan_1st_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    luan_1st_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
