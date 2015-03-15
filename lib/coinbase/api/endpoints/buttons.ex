defmodule Coinbase.API.Buttons do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "buttons"
  @data_struct Coinbase.Button
  @order_struct Coinbase.Order
  @search_key String.to_atom(@endpoint)

  @doc """
  Create a new payment button, page, or iFrame

  Optional params:
    account_id (string): Specify for which account is the order created. The default is your primary account
  """
  @spec create(pid, map, map) :: Coinbase.response
  def create(coinbase, button, optionals \\ %{}) do
    params = %{button: button}
    params = add_optionals(params, optionals)
    Base.post(coinbase, @endpoint, params, @data_struct, @search_key)
  end

  @doc """
  Show a button
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @search_key)
  end

  @doc """
  Create an order for a button
  """
  @spec create_order(pid, binary) :: Coinbase.response
  def create_order(coinbase, id) do
    Base.post(coinbase, "#{@endpoint}/#{id}/create_order", @order_struct, String.to_atom("orders"))
  end

  @doc """
  List orders for a button
  """
  @spec list_orders(pid, binary) :: Coinbase.response
  def list_orders(coinbase, id) do
    Base.get(coinbase, "#{@endpoint}/#{id}/orders", @order_struct, String.to_atom("orders"))
  end
end
