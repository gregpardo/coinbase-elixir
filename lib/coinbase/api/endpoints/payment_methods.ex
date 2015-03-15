defmodule Coinbase.API.PaymentMethods do
  alias Coinbase.API.Base

  @endpoint "payment_methods"
  @data_struct Coinbase.PaymentMethod
  @search_key String.to_atom(@endpoint)

  @doc """
  Lists payment methods
  """
  @spec list(pid) :: Coinbase.response
  def list(coinbase) do
    Base.list(coinbase, @endpoint, %{}, @data_struct, @search_key)
  end

  @doc """
  Show a payment method
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @search_key)
  end
end
