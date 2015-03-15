defmodule Coinbase.API.Subscriptions do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "subscribers"
  @data_struct Coinbase.RecurringPayment
  @search_key :recurring_payments

  @doc """
  List subscriptions

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.list(coinbase, @endpoint, params, @data_struct, @search_key)
  end

  @doc """
  Show a subscription

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account
  """
  @spec get(pid, binary, map) :: Coinbase.response
  def get(coinbase, id, optionals) do
    params = add_optionals(%{}, optionals)
    Base.get(coinbase, @endpoint, id, params, @data_struct, @search_key)
  end
end
