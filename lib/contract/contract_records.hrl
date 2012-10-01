%% Ancillary types.
-record(party, {}).
-record(price, {amount, currency}).
-record(instrument, {}).

%% Simple contracts.
-record(simple_contract, {kind, counterparty, amount, price, instrument}).
