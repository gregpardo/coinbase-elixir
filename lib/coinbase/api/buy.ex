defmodule Coinbase.API.Buy do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "buys"
  @data_struct Coinbase.Authorization
  @collection_name String.to_atom(@endpoint)

  @doc """
  Buy bitcoin

  Optional params:
    account_id (string): Specify which account is used for crediting bought amount. The default is your primary account.
    currency (string): Currency of qty, must be either BTC or the currency of the payment method.
    agree_btc_amount_varies (boolean): Whether or not you would still like to buy if you have to wait for your money to arrive to lock in a price.
    commit (boolean): Defaults to true. If set to false, this buy will not be immediately completed. Use the Transfers.commit() call to complete it
  """
  @spec buy(pid, binary, map) :: Coinbase.response
  def buy(coinbase, qty, optionals \\ %{}) do
    params = %{qty: qty}
    params = add_optionals(params, optionals)
    Base.post(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

end
