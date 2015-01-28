defmodule Coinbase.API.Authorization do

  @endpoint "authorization"
  @data_struct Coinbase.Authorization
  @collection_name String.to_atom(@endpoint)

  @doc """
  Show authorization information
  """
  @spec get(pid) :: Coinbase.response
  def get(coinbase) do
    Base.get(coinbase, @endpoint, @data_struct, @collection_name)
  end

end
