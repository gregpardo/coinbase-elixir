defmodule Coinbase.API.Refunds do
  alias Coinbase.API.Base

  @endpoint "refunds"
  @data_struct Coinbase.Refund
  @search_key String.to_atom(@endpoint)

  @doc """
  Show a refund
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @search_key)
  end
end
