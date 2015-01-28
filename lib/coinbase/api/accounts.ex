defmodule Coinbase.API.Accounts do
  alias Coinbase.API.Base

  @endpoint "accounts"
  @data_struct Coinbase.Account
  @address_struct Coinbase.Address
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

  @doc """
  Get an account's balance
  """
  @spec get_balance(pid, binary) :: Coinbase.response
  def get_balance(coinbase, id) do
    Base.get(coinbase, "#{@endpoint}/#{id}/balance", @data_struct, @collection_name)
  end

  @doc """
  Get an accounts bitcoin address
  """
  @spec get_address(pid, binary) :: Coinbase.response
  def get_address(coinbase, id) do
    Base.get(coinbase, "#{@endpoint}/#{id}/address", @data_struct, @collection_name)
  end

  @doc """
  Create a new bitcoin address for an account
  """
  @spec create_address(pid, binary, binary, binary) :: Coinbase.response
  def create_address(coinbase, id, callback_url, label) do
    address = %{address: %{callback_url: callback_url, label: label}}
    Base.post(coinbase, "#{@endpoint}/#{id}/address", address, @address_struct, @collection_name)
  end

  @doc """
  Updates a account
  """
  @spec update(pid, map) :: Coinbase.response
  def update(coinbase, account) do
    Base.put(coinbase, "#{@endpoint}/#{account.id}", account, @data_struct, @collection_name)
  end

  @doc """
  Set account as primary
  """
  @spec set_primary(pid, binary) :: Coinbase.response
  def set_primary(coinbase, id) do
    Base.post(coinbase, "#{@endpoint}/#{id}/primary", @data_struct, @collection_name)
  end

  @doc """
  Delete an account (only non-primary accounts with zero balance)
  """
  @spec delete(pid, binary) :: Coinbase.response
  def delete(coinbase, id) do
    Base.delete(coinbase, @endpoint, id, @data_struct, @collection_name)
  end
end
