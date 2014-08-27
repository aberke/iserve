%%% Description : Simple one for one supervisor for servers/listeners
-module(iserve_server_sup).
-behaviour(supervisor).

-export([start_link/0,
	 start_link/1,
	 add_server/2
	]).

-export([init/1]).

-define(SERVER, ?MODULE).

%%% API functions

%% Register under the module name
start_link() ->
    io:format("iserve_server_sup.erl start_link([])*************"),
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).
start_link(Supervisor) ->
    io:format("iserve_server_sup.erl start_link(~w)*************~n",[Supervisor]),
    Outcome = supervisor:start_link({local, ?SERVER}, ?MODULE, [Supervisor]),
    io:format("---Outcome: ~w~n",[Outcome]),
    Outcome.

%% Add new dynamic worker
add_server(Supervisor, Conf) ->
    supervisor:start_child(Supervisor, [Conf]).

%%% Supervisor callbacks

init(_) ->
    io:format("!!!!!iserve_server_sup.erl init(_)*************~n",[]),
    %% The dynamic worker. We pass it a reference to the master
    %% process as the first arg, more args added at the time the
    %% workers are added.
    AChild = {iserve_server,{iserve_server,start_link,[iserve_master]},
	      temporary,2000,worker,[iserve_server]},
    
    io:format("iserve_server_sup.erl start_link([])111111,~n",[]),
    {ok,
     {{simple_one_for_one,10,300}, 
      [AChild]}}.

%%% Internal functions
