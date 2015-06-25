defmodule Coinbase.API.Currencies do
  alias Coinbase.API.Base

  @endpoint "currencies"
  @as_none :none
  @as_key_currencies :currencies

  @doc """
  List currencies supported by Coinbase
  """
  @spec list(pid) :: Coinbase.response
  def list(coinbase) do
    Base.list(coinbase, @endpoint, %{}, @as_none, @as_key_currencies)
  end

  @doc """
  List exchange rates between BTC and other currencies
  """
  @spec exchange_rates(pid) :: Coinbase.response
  def exchange_rates(coinbase) do
    Base.get(coinbase, "#{@endpoint}/exchange_rates", %{}, @as_none, @as_key_currencies)
  end
end
