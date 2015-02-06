defmodule Coinbase.API.Buttons do
  alias Coinbase.API.Base

  @endpoint "buttons"
  @data_struct Coinbase.Button
  @order_struct Coinbase.Order
  @collection_name String.to_atom(@endpoint)

  @doc """
  Create a new payment button, page, or iFrame
  """
  @spec create(pid, binary, binary) :: Coinbase.response
  def create(coinbase, button, account_id \\ nil) do
    data = %{button: button}
    data = Base.optional_param(data, "account_id", account_id)
    Base.post(coinbase, @endpoint, data, @data_struct, @collection_name)
  end

  @doc """
  Show a button
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @collection_name)
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
