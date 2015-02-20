defmodule Coinbase.API.Buy do

  @endpoint "buys"
  @data_struct Coinbase.Authorization
  @collection_name String.to_atom(@endpoint)

  @doc """
  Buy bitcoin (Create a buy object to use this)
  """
  @spec buy(pid, Coinbase.Buy) :: Coinbase.response
  def buy(coinbase, buy) do
    Base.post(coinbase, @endpoint, buy, @data_struct, @collection_name)
  end

end
