defmodule Coinbase.API.PaymentMethods do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "payment_methods"
  @data_struct Coinbase.PaymentMethod
  @collection_name String.to_atom(@endpoint)

  @doc """
  Lists payment methods
  """
  @spec list(pid) :: Coinbase.response
  def list(coinbase) do
    Base.list(coinbase, @endpoint, %{}, @data_struct, @collection_name)
  end

  @doc """
  Show a payment method
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @collection_name)
  end
end
