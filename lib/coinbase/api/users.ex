defmodule Coinbase.API.Users do
  alias Coinbase.API.Base

  @endpoint "users"
  @data_struct Coinbase.User
  @collection_name String.to_atom(@endpoint)

  @doc """
  Gets the current user
  """
  @spec get_current(pid) :: Coinbase.response
  def get_current(coinbase) do
    Base.get(coinbase, @endpoint, "self", @data_struct, @collection_name)
  end
end
