defmodule Coinbase.API.RecurringPayments do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "recurring_payments"
  @data_struct Coinbase.RecurringPayment
  @collection_name String.to_atom(@endpoint)

  @doc """
  List recurring payments

  Optional params:
    page (integer): Can be used to page through results. Default value is 1.
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.list(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

  @doc """
  Show a recurring payment
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @collection_name)
  end
end
