defmodule Coinbase.API.Orders do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "orders"
  @data_struct Coinbase.Order
  @collection_name String.to_atom(@endpoint)

  @doc """
  List orders

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account.
    page (integer): Can be used to page through results. Default value is 1.
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.list(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

  @doc """
  Show an order
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id_or_custom_field) do
    Base.get(coinbase, @endpoint, id_or_custom_field, @data_struct, @collection_name)
  end

  @doc """
  Create an order

  This endpoint is a shortcut combining two other endpoints: Coinbase.API.Buttons.create and Coinbase.API.Buttons.create_order

  For more information on what this endpoin does read the official documentation...
  https://developers.coinbase.com/api#create-an-order

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account.
  """
  @spec create(pid, map) :: Coinbase.response
  def create(coinbase, button) do
    params = %{button: button}
    Base.post(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

  @doc """
  Refund an order

  Optional params:
    mispayment_id (string): The ID of a mispayment to be refunded. If left blank, the original order transaction will be refunded, if the order status is completed.
    external_refund_address (string): This field is required if the order or mispayment does not already have a value for refund_address. Must be a valid bitcoin address. If this field is specified but the order or mispayment already has a refund_address that was automatically added by Coinbase, the already-present refund_address will take precendence over the external_refund_address specified.
    instant_buy (boolean): If true, will make an instant purchase for any amount of bitcoin attempting to be sent that is not already available in the account balance.
  """
  @spec refund(pid, binary, map) :: Coinbase.response
  def refund(coinbase, id_or_custom_field, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.post(coinbase, "#{@endpoint}/#{id_or_custom_field}/refund", params, @data_struct, @collection_name)
  end
end
