defmodule Coinbase.API.Addresses do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "addresses"
  @as_address Coinbase.Address
  @as_key_address :address

  @doc """
  Lists bitcoin addresses

  Optional params:
    page (integer): Can be used to page through results. Default value is 1.
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
    account_id (string): Specify which account is used for fetching data. The default is your primary account
    query (string): Optional string match to filter addresses. 
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    options = %{as: @as_address, as_key: @as_key_address, params: params}
    Base.list(coinbase, @endpoint, options)
  end

  @doc """
  Show bitcoin address
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    options = %{as: @as_address, as_key: @as_key_address}
    Base.get(coinbase, "#{@endpoint}/#{id}", options)
  end
end
