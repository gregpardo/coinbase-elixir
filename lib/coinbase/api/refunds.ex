defmodule Coinbase.API.Refunds do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "refunds"
  @data_struct Coinbase.Refund
  @collection_name String.to_atom(@endpoint)

  @doc """
  Show a refund
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @collection_name)
  end
end
