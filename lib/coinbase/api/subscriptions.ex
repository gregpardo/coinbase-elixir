defmodule Coinbase.API.Subscriptions do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "subscribers"
  @data_struct Coinbase.RecurringPayment
  @collection_name :recurring_payments

  @doc """
  List subscriptions

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.list(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

  @doc """
  Show a subscription
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @collection_name)
  end
end
