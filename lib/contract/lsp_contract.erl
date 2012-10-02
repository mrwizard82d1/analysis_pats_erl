-module(lsp_contract).
-include_lib("eunit/include/eunit.hrl").
-include("contract_records.hrl").
-compile(export_all).


%% Constructors.
new(LongParty, ShortParty, Amount, Price, Instrument) ->
    #lsp_contract{long_party=LongParty, short_party=ShortParty,
		  amount=Amount, price=Price, instrument=Instrument}.


%% Accessors.
long_party(#lsp_contract{long_party=LongParty}) ->
    LongParty.
short_party(#lsp_contract{short_party=ShortParty}) ->
    ShortParty.
amount(#lsp_contract{amount=Amount}) ->
    Amount.
price(#lsp_contract{price=Price}) ->
    Price.
instrument(#lsp_contract{instrument=Instrument}) ->
    Instrument.


%% Unit tests.
long_test() ->
    ContractAmount = 3.1415,
    ContractPrice = 9.265,
    LongParty = party:new("Long Party"),
    ShortParty = party:new("Short Party"),
    Currency=usd,
    ToTest = new(LongParty, ShortParty, ContractAmount,
		 #price{amount=ContractPrice, currency=Currency},
		 #instrument{}),
    ?assertEqual(LongParty, long_party(ToTest)),
    ?assertEqual(ShortParty, short_party(ToTest)),
    ?assertEqual(ContractAmount, amount(ToTest)),
    ?assertEqual(#price{amount=ContractPrice, currency=Currency},
		 price(ToTest)),
    ?assertEqual(#instrument{}, instrument(ToTest)).
short_test() ->
    ContractAmount = 27.18,
    ContractPrice = 1.414,
    LongParty = party:new("Long Party"),
    ShortParty = party:new("Short Party"),
    Currency = cad,
    ToTest = new(LongParty, ShortParty, ContractAmount,
		 #price{amount=ContractPrice, currency=Currency},
		 #instrument{}),
    ?assertEqual(LongParty, long_party(ToTest)),
    ?assertEqual(ShortParty, short_party(ToTest)),
    ?assertEqual(ContractAmount, amount(ToTest)),
    ?assertEqual(#price{amount=ContractPrice,
			currency=Currency}, price(ToTest)),
    ?assertEqual(#instrument{}, instrument(ToTest)).
