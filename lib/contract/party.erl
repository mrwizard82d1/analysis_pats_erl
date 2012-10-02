-module(party).
-include("contract_records.hrl").
-export([new/1]).


%% Constructors.
new(Name) ->
    #party{name=Name}.
