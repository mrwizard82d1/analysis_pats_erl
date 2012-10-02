%% Ancillary types.
-record(party, {name}).
-record(price, {amount, currency}).
-record(instrument, {}).

%% Simple contracts.
-record(simple_contract, {kind, counterparty, amount, price, instrument}).
-record(lsp_contract, {long_party, short_party, amount, price, instrument}).
