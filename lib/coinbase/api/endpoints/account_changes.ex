defmodule Coinbase.API.AccountChanges do
  alias Coinbase.API.Base

  @endpoint "account_changes"
  @data_struct Coinbase.AccountChange
  @collection_name String.to_atom(@endpoint)

  @doc """
  List changes to an account
  """
  @spec list(pid, number, number, binary) :: Coinbase.response
  def list(coinbase, limit \\ 25, page \\ 1, account_id \\ nil) do
    params = %{limit: limit, page: page}
    unless account_id == nil do
      params = Map.merge(params, %{account_id: account_id})
    end
    Base.list(coinbase, @endpoint, params, @data_struct, @collection_name)
  end
end
