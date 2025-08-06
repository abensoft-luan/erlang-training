%%%-------------------------------------------------------------------
%% @doc luan_2nd public API
%% @end
%%%-------------------------------------------------------------------

-module(luan_2nd_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    luan_2nd_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
