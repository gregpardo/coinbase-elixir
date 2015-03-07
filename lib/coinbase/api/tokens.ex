defmodule Coinbase.API.Tokens do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "tokens"
  @data_struct Coinbase.Token
  @collection_name String.to_atom(@endpoint)

  @doc """
  Create a token which can be redeemed for bitcoin
  """
  @spec create(pid) :: Coinbase.response
  def create(coinbase) do
    Base.post(coinbase, @endpoint, %{}, @data_struct, @collection_name)
  end

  @doc """
  Redeem a token, claiming its address and all its bitcoin
  """
  @spec redeem(pid, binary) :: Coinbase.response
  def redeem(coinbase, token_id) do
    params = %{token_id: token_id}
    Base.post(coinbase, "#{@endpoint}/redeem", params, @data_struct, @collection_name)
  end

end
