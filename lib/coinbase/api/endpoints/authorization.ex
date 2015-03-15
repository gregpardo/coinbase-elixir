defmodule Coinbase.API.Authorization do
  alias Coinbase.API.Base

  @endpoint "authorization"
  @as_authorization Coinbase.Authorization
  @as_key_authorization :authorization

  @doc """
  Show authorization information
  """
  @spec get(pid) :: Coinbase.response
  def get(coinbase) do
    options = %{as: @as_authorization, as_key: @as_key_authorization}
    Base.get(coinbase, @endpoint, options)
  end
end
