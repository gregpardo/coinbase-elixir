defmodule Coinbase.API.Currencies do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "currencies"
  @data_struct :none
  @collection_name String.to_atom(@endpoint)

  @doc """
  List currencies supported by Coinbase
  """
  @spec list(pid) :: Coinbase.response
  def list(coinbase) do
    Base.list(coinbase, @endpoint, %{}, @data_struct, @collection_name)
  end

  @doc """
  List exchange rates between BTC and other currencies
  """
  @spec exchange_rates(pid) :: Coinbase.response
  def exchange_rates(coinbase) do
    Base.get(coinbase, "#{@endpoint}/exchange_rates", %{}, @data_struct, @collection_name)
  end
end
