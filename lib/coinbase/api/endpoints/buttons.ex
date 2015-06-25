defmodule Coinbase.API.Buttons do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "buttons"
  @as_button Coinbase.Button
  @as_key_button :button
  @as_order Coinbase.Order
  @as_key_order :order

  @doc """
  Create a new payment button, page, or iFrame

  Optional params:
    account_id (string): Specify for which account is the order created. The default is your primary account
  """
  @spec create(pid, map, map) :: Coinbase.response
  def create(coinbase, button, optionals \\ %{}) do
    body = %{button: button}
    body = add_optionals(%{}, optionals)
    options = %{as: @as_button, as_key: @as_key_button, body: body}
    Base.post(coinbase, @endpoint, options)
  end

  @doc """
  Show a button
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    options = %{as: @as_button, as_key: @as_key_button}
    Base.get(coinbase, "#{@endpoint}/#{id}", options)
  end

  @doc """
  Create an order for a button
  """
  @spec create_order(pid, binary) :: Coinbase.response
  def create_order(coinbase, id) do
    options = %{as: @as_order, as_key: @as_key_order}
    Base.post(coinbase, "#{@endpoint}/#{id}/create_order", options)
  end

  @doc """
  List orders for a button
  """
  @spec list_orders(pid, binary) :: Coinbase.response
  def list_orders(coinbase, id) do
    options = %{as: @as_order, as_key: @as_key_order}
    Base.list(coinbase, "#{@endpoint}/#{id}/orders", options)
  end
end
