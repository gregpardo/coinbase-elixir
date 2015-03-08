defmodule Coinbase.API.Transfer do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "transfers"
  @data_struct Coinbase.Transfer
  @collection_name String.to_atom(@endpoint)

  @doc """
  List buy and sell history

  Optional params:
    page (integer): Can be used to page through results. Default value is 1.
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
    account_id (string): Specify which account is used for fetching data. The default is your primary account
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.list(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

  @doc """
  Show a transfer

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account
  """
  @spec get(pid, binary, map) :: Coinbase.response
  def get(coinbase, id, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.get(coinbase, @endpoint, id, params, @data_struct, @collection_name)
  end

  @doc """
  Start a transfer that is in the created state

  Optional params:
    account_id (string): Specify which account is used for fetching data. The default is your primary account
  """
  @spec commit(pid, binary, map) :: Coinbase.response
  def commit(coinbase, id, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.post(coinbase, "#{@endpoint}/#{id}/commit", params, @data_struct, @collection_name)
  end
end
