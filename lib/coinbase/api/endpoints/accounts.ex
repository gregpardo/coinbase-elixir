defmodule Coinbase.API.Accounts do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "accounts"
  @as_account Coinbase.Account
  @as_key_account :account
  @as_balance Coinbase.Balance
  @as_key_balance :balance
  @as_address Coinbase.Address
  @as_key_address :address

  @doc """
  Gets a list of accounts

  Optional params:
    page (integer): Can be used to page through results. Default value is 1.
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
    all_accounts (integer): Set this to true to also list inactive accounts.
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    options = %{as: @as_account, as_key: @as_key_account, params: params}
    Base.list(coinbase, @endpoint, options)
  end

  @doc """
  Gets an account
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    options = %{as: @as_account, as_key: @as_key_account}
    Base.get(coinbase, "#{@endpoint}/#{id}", options)
  end

  @doc """
  Create an account (supports multisig)

  Optional params:
    account[type] (string): Type of account. If creating a HDM (multisig) account, specify multisig.
    account[m] (string): Number of required signatures to spend from HDM multisig account.
    account[xpubkeys] (array): Array of extended public keys of BIP32 wallets. Length of array must be greater or equal than 'm' to create a complete account.
  """
  @spec create(pid, binary, map) :: Coinbase.response
  def create(coinbase, name, optionals \\ %{}) do
    body = %{account: %{name: name}}
    body = add_optionals(body, optionals)
    options = %{as: @as_account, as_key: @as_key_account, body: body}
    Base.post(coinbase, @endpoint, options)
  end

  @doc """
  Get an account's balance
  """
  @spec get_balance(pid, binary) :: Coinbase.response
  def get_balance(coinbase, id) do
    options = %{as: @as_balance, as_key: @as_key_balance}
    Base.get(coinbase, "#{@endpoint}/#{id}/balance", options)
  end

  @doc """
  Get an accounts bitcoin address
  """
  @spec get_address(pid, binary) :: Coinbase.response
  def get_address(coinbase, id) do
    options = %{as: @as_address, as_key: @as_key_address}
    Base.get(coinbase, "#{@endpoint}/#{id}/address", options)
  end

  @doc """
  Create a new bitcoin address for an account
  """
  @spec create_address(pid, binary,  map) :: Coinbase.response
  def create_address(coinbase, account_id, optionals \\ %{}) do
    body = add_optionals(%{}, optionals)
    options = %{as: @as_address, as_key: @as_key_address, body: body}
    Base.post(coinbase, "#{@endpoint}/#{account_id}/address", options)
  end

  @doc """
  Updates a account
  """
  @spec update(pid, binary, map) :: Coinbase.response
  def update(coinbase, id, account) do
    body = %{account: account}
    options = %{as: @as_account, as_key: @as_key_account, body: body}
    Base.put(coinbase, "#{@endpoint}/#{id}", options)
  end

  @doc """
  Set account as primary
  """
  @spec set_primary(pid, binary) :: Coinbase.response
  def set_primary(coinbase, id) do
    Base.post(coinbase, "#{@endpoint}/#{id}/primary", %{as: :none})
  end

  @doc """
  Delete an account (only non-primary accounts with zero balance)
  """
  @spec delete(pid, binary) :: Coinbase.response
  def delete(coinbase, id) do
    options = %{as: @as_account, as_key: @as_account}
    Base.delete(coinbase, "#{@endpoint}/#{id}", options)
  end
end
