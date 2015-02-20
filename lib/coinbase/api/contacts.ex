defmodule Coinbase.API.Contacts do

  @endpoint "contacts"
  @data_struct Coinbase.Contact
  @collection_name String.to_atom(@endpoint)

  @doc """
  List emails the user has previously used for autocompletion
  """
  @spec list(pid, number, number, binary) :: Coinbase.response
  def list(coinbase, limit \\ 25, page \\ 1, query \\ nil) do
    params = %{limit: limit, page: page}
    params = Base.optional_param(params, "query", query)
    Base.list(coinbase, @endpoint, params, @data_struct, @collection_name)
  end
end
