defmodule Coinbase.API.Sells do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "sells"
  @data_struct Coinbase.Transfer
  @search_key :transfers

  @doc """
  Sell bitcoin

  Optional params:
    account_id (string): Specify which account is used to sell from. The default is your primary account
    currency (string): The quantity of bitcoin you would like to sell
    agree_btc_amount_varies (boolean): Whether or not you would still like to sell if you have to wait for your money to arrive to lock in a price.
    commit (boolean): Defaults to true. If set to false, this sell will not be immediately completed. Use the Coinbase.API.Transfers.commit(pid, id) call to complete it
    payment_method_id (string): The ID of the payment method that should be used for the sell. Payment methods can be listed using the /payment_methods API call.
  """
  @spec sell(pid, binary, map) :: Coinbase.response
  def sell(coinbase, qty, optionals \\ %{}) do
    params = %{qty: qty}
    params = add_optionals(params, optionals)
    Base.post(coinbase, @endpoint, params, @data_struct, @search_key)
  end
end
