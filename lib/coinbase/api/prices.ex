defmodule Coinbase.API.Prices do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "prices"
  @data_struct Coinbase.Price
  @collection_name :totals # Note we use totals here because that's probabably what people would most care about

  @doc """
  Get the buy price for bitcoin

  Optional params:
    qty (string): The quantity of bitcoin you would like to buy (default is 1).
    currency (string): Default is USD. Right now this is the only value allowed.
  """
  @spec get_buy(pid, map) :: Coinbase.response
  def get_buy(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.get(coinbase, "#{@endpoint}/buy", params, @data_struct, @collection_name)
  end

  @doc """
  Get the sell price for bitcoin

  Optional params:
    qty (string): The quantity of bitcoin you would like to buy (default is 1).
    currency (string): Default is USD. Right now this is the only value allowed.
  """
  @spec get_sell(pid, map) :: Coinbase.response
  def get_sell(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.get(coinbase, "#{@endpoint}/sell", params, @data_struct, @collection_name)
  end

  @doc """
  Get the spot price for bitcoin

  Optional params:
    currency (string): Default is USD. Right now this is the only value allowed.
  """
  @spec get_spot(pid, map) :: Coinbase.response
  def get_spot(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.get(coinbase, "#{@endpoint}/spot_rate", params, @data_struct, @collection_name)
  end

  @doc """
  Get the historical spot price for bitcoin
  NOTE: This endpoint is currently broken because of the response type

  Optional params:
    page (string): Can be used to page through results. Default is 1.
  """
  @spec get_historical(pid, map) :: Coinbase.response
  def get_historical(coinbase, optionals \\ %{}) do
    false
    #params = add_optionals(%{}, optionals)
    #Base.get(coinbase, "#{@endpoint}/historical", params, @data_struct, @collection_name)
  end
end
