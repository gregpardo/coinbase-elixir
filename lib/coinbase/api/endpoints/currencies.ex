defmodule Coinbase.API.Currencies do
  alias Coinbase.API.Base

  @endpoint "currencies"
  @data_struct :none
  @search_key String.to_atom(@endpoint)

  @doc """
  List currencies supported by Coinbase
  """
  @spec list(pid) :: Coinbase.response
  def list(coinbase) do
    Base.list(coinbase, @endpoint, %{}, @data_struct, @search_key)
  end

  @doc """
  List exchange rates between BTC and other currencies
  """
  @spec exchange_rates(pid) :: Coinbase.response
  def exchange_rates(coinbase) do
    Base.get(coinbase, "#{@endpoint}/exchange_rates", %{}, @data_struct, @search_key)
  end
end
