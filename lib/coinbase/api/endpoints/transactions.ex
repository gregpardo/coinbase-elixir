defmodule Coinbase.API.Transactions do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "transactions"
  @data_struct Coinbase.Transaction
  @search_key String.to_atom(@endpoint)

  @doc """
  Lists transactions

  Optional params:
    page (integer): Can be used to page through results. Default value is 1.
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
    account_id (string): Specify which account is used for fetching data. The default is your primary account
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.list(coinbase, @endpoint, params, @data_struct, @search_key)
  end

  @doc """
  Show a transaction

  Optional params:
    account_id (string): Specify which account is used for fetching data. THe default is your primary account
  """
  @spec get(pid, binary, map) :: Coinbase.response
  def get(coinbase, id, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.get(coinbase, @endpoint, id, params, @data_struct, @search_key)
  end

  @doc """
  Send money

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account.
    transaction[amount] (string): A string amount that will be converted to BTC, such as 1 or 1.234567. If you want to use a different currency you can set amount_string and amount_currency_iso instead. This will automatically convert the amount to BTC and that converted amount will show in the transaction.
    transaction[amount_string] (string): A string amount that can be in any currency. If you use this with amount_currency_iso you should leave amount blank.
    transaction[amount_currency_iso] (string): A currency symbol such as USD, EUR, or BTC
    transaction[notes] (string): Notes to be included in the email that the recipient receives.
    transaction[user_fee] (string): Optional transaction fee in BTC if you would like to pay it. Coinbase pays transaction fees on payments greater than or equal to 0.001 BTC. But for smaller amounts you may want to add your own amount. Fees can be added as a string, such as 0.0005.
    transaction[referrer_id] (string): Optional id of the user to get a referral credit in the case that this transaction makes the user eligible. The referring user is eligible for a credit if the address in the to field is an email address for which there is currently no registered account and the recipient proceeds to buy or sell at least 100 USD worth of BTC.
    transaction[idem] (string): An optional token to ensure idempotence. If a previous transaction with the same idem parameter already exists for this sender, that previous transaction will be returned and a new one will not be created. Max length 100 characters.
    transaction[instant_buy] (boolean): Optional parameter signaling that if your account does not currently have enough funds to cover the amount, first purchase the difference with an instant buy, then send the bitcoin. For example, if you want to send 1.25 BTC, but your account only has 0.5 BTC, typically you would get an error. If you pass instant_buy as true and also have Instant Buy enabled on your account, then first an instant purchase will be made for 0.75 BTC, and once purchased, the full 1.25 BTC will be sent. If the instant buy is successful, the response will come back with an additional transfer field representing the purchase
    transaction[order_id] (string): Use this field to associate this transaction with an order as a refund. This transaction’s ID will appear in the order’s manual_refund_tx_ids field.
  """
  @spec send_money(pid, map, map) :: Coinbase.response
  def send_money(coinbase, transaction, optionals \\ %{}) do
    params = add_optionals(transaction, optionals)
    Base.post(coinbase, "#{@endpoint}/send_money", params, @data_struct, @search_key)
  end

  @doc """
  Transfer money between two accounts

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account.
    transaction[amount] (string): A string amount that will be converted to BTC, such as 1 or 1.234567. Also must be >= 0.01 or it will shown an error
  """
  @spec transfer_money(pid, map, map) :: Coinbase.response
  def transfer_money(coinbase, transaction, optionals \\ %{}) do
    params = add_optionals(transaction, optionals)
    Base.post(coinbase, "#{@endpoint}/transfer_money", params, @data_struct, @search_key)
  end

  @doc """
  Request money

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account.
    transaction[amount] (string): A string amount that will be converted to BTC, such as 1 or 1.234567. If you want to use a different currency you can set amount_string and amount_currency_iso instead. This will automatically convert the amount to BTC and that converted amount will show in the transaction.
    transaction[amount_string] (string): A string amount that can be in any currency. If you use this with amount_currency_iso you should leave amount blank.
    transaction[amount_currency_iso] (string): A currency symbol such as USD, EUR, or BTC
    transaction[notes] (string): Notes to be included in the email that the recipient receives.
  """
  @spec request_money(pid, map, map) :: Coinbase.response
  def request_money(coinbase, transaction, optionals \\ %{}) do
    params = add_optionals(transaction, optionals)
    Base.post(coinbase, "#{@endpoint}/request_money", params, @data_struct, @search_key)
  end

  @doc """
  Resend bitcoin request

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account.
  """
  @spec resend_request(pid, binary, map) :: Coinbase.response
  def resend_request(coinbase, id, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.put(coinbase, "#{@endpoint}/#{id}/resend_request", params, @data_struct, @search_key)
  end

  @doc """
  Complete bitcoin request

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account.
  """
  @spec complete_request(pid, binary, map) :: Coinbase.response
  def complete_request(coinbase, id, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.put(coinbase, "#{@endpoint}/#{id}/complete_request", params, @data_struct, @search_key)
  end

  @doc """
  Cancel bitcoin request

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account.
  """
  @spec cancel_request(pid, binary, map) :: Coinbase.response
  def cancel_request(coinbase, id, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.put(coinbase, "#{@endpoint}/#{id}/cancel_request", params, @data_struct, @search_key)
  end

  @doc """
  Get signature hashes for each input that needs signing in a spend from multisig transaction
  (multisig)

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account.
  """
  @spec sighashes(pid, binary, map) :: Coinbase.response
  def sighashes(coinbase, id, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.get(coinbase, "#{@endpoint}/#{id}/sighashes", params, @data_struct, @search_key)
  end

  @doc """
  Submit required signatures for a multisig spend transaction
  (multisig)

  'signatures' object is an list of Coinbase.Signature
  """
  @spec signatures(pid, binary, map) :: Coinbase.response
  def signatures(coinbase, id, signatures) do
    params = %{signatures: signatures}
    Base.put(coinbase, "#{@endpoint}/#{id}/signatures", params, @data_struct, @search_key)
  end
end
