defmodule Coinbase.API.Accounts do
  alias Coinbase.API.Base
  alias Coinbase.Account

  @endpoint "accounts"
  @data_struct Coinbase.Account
  @collection_name String.to_atom(@endpoint)

  @doc """
  Gets a list of accounts
  Allows for optional page, limit and all_accounts parameters
  """
  @spec list(pid, number, number, boolean) :: Coinbase.response
  def list(coinbase, limit \\ 25, page \\ 1, all_accounts \\ false) do
    params = %{limit: limit, page: page, all_accounts: all_accounts}
    Base.list(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

  @doc """
  Gets an account
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @collection_name)
  end

  @doc """
  Create an account
  """
  @spec create(pid, binary) :: Coinbase.response
  def create(coinbase, name) do
    data = %{account: %{name: name}}
    Base.post(coinbase, @endpoint, data, @data_struct, @collection_name)
  end
end
