-module(simple_contract).
-include("contract_records.hrl").
-include_lib("eunit/include/eunit.hrl").
-export([make_contract/5]).


%% Constructor.
make_contract(long, Party, Amount, Price, Instrument) ->
    #simple_contract{kind=long, counterparty=Party, amount=Amount,
		     price=Price, instrument=Instrument};
make_contract(short, Party, Amount, Price, Instrument) ->
    #simple_contract{kind=short, counterparty=Party, amount=Amount,
		     price=Price, instrument=Instrument}.


%% Accessors
kind(#simple_contract{kind=Kind}) ->
    Kind.
counterparty(#simple_contract{counterparty=CounterParty}) ->
    CounterParty.
amount(#simple_contract{amount=Amount}) ->
    Amount.
price(#simple_contract{price=Price}) ->
    Price.
instrument(#simple_contract{instrument=Instrument}) ->
    Instrument.


%% Unit tests.
long_test() ->
    ContractAmount = 3.1415,
    ContractPrice = 9.265,
    Party = party:new("Long Party"),
    ToTest = make_contract(long, Party, ContractAmount,
			   #price{amount=ContractPrice, currency=usd},
			   #instrument{}),
    ?assertEqual(long, kind(ToTest)),
    ?assertEqual(Party, counterparty(ToTest)),
    ?assertEqual(ContractAmount, amount(ToTest)),
    ?assertEqual(#price{amount=ContractPrice, currency=usd}, price(ToTest)),
    ?assertEqual(#instrument{}, instrument(ToTest)).
short_test() ->
    ContractAmount = 27.18,
    ContractPrice = 1.414,
    Party = party:new("Short Party"),
    Currency = cad,
    ToTest = make_contract(short, Party, ContractAmount,
			   #price{amount=ContractPrice, currency=Currency},
			   #instrument{}),
    ?assertEqual(short, kind(ToTest)),
    ?assertEqual(Party, counterparty(ToTest)),
    ?assertEqual(ContractAmount, amount(ToTest)),
    ?assertEqual(#price{amount=ContractPrice, currency=Currency},
		 price(ToTest)),
    ?assertEqual(#instrument{}, instrument(ToTest)).
