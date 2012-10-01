-module(simple_contract).
-include("contract_records.hrl").
-include_lib("eunit/include/eunit.hrl").
-compile(export_all).


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
ctor_test() ->
    ToTest = make_contract(long, #party{}, 3.1415,
			   #price{amount=9.265, currency=usd},
			   #instrument{}),
    long = kind(ToTest),
    #party{} = counterparty(ToTest),
    3.1415 = amount(ToTest),
    #price{amount=9.265, currency=usd} = price(ToTest),
    #instrument{} = instrument(ToTest).
