defmodule Coinbase.API.Addresses do
  alias Coinbase.API.Base

  @endpoint "addresses"
  @data_struct Coinbase.Address
  @collection_name String.to_atom(@endpoint)

  @doc """
  Lists bitcoin addresses
  """
  @spec list(pid, number, number, binary) :: Coinbase.response
  def list(coinbase, limit \\ 25, page \\ 1, account_id \\ nil, query \\ nil) do
    params = %{limit: limit, page: page}
    params = Base.optional_param(params, "account_id", account_id)
    params = Base.optional_param(params, "query", query)
    Base.list(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

  @doc """
  Show bitcoin address
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @collection_name)
  end
end
