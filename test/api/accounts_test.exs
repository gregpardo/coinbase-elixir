Code.require_file "../test_helper.exs", __DIR__
Code.require_file "../coinbase_setup_helper.exs", __DIR__

defmodule AccountsTest do
  import TypeAssertions
  import CoinbaseSetupHelper
  alias Coinbase.API.Accounts
  alias Coinbase.Account
  alias Coinbase.Balance
  alias Coinbase.Address
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    coinbase_setup("accounts")
  end

  test "accounts list", context do
    IO.puts "\nAPI: Accounts -> List"
    use_cassette "accounts_list", custom: true do
      {status, response} = Accounts.list(context[:coinbase])
      assert_contains_type(response.accounts, Account)
      assert status == :ok
    end
  end

  test "accounts get", context do
    IO.puts "\nAPI: Accounts -> Get"
    use_cassette "accounts_get", custom: true do
      {status, response} = Accounts.get(context[:coinbase], "536a541fa9393bb3c7000023")
      assert_contains_type(response, Account)
      assert status == :ok
    end
  end

  test "accounts create", context do
    IO.puts "\nAPI: Accounts -> Create"
    use_cassette "accounts_create", custom: true do
      {status, response} = Accounts.create(context[:coinbase], "Savings Wallet")
      assert_contains_type(response, Account)
      assert status == :ok
    end
  end

  test "accounts get balance", context do
    IO.puts "\nAPI: Accounts -> Get Balance"
    use_cassette "accounts_get_balance", custom: true do
      {status, response} = Accounts.get_balance(context[:coinbase], "536a541fa9393bb3c7000034")
      assert_contains_type(response, Balance)
      assert status == :ok
    end
  end

  test "accounts get address", context do
    IO.puts "\nAPI: Accounts -> Get Address"
    use_cassette "accounts_get_address", custom: true do
      {status, response} = Accounts.get_address(context[:coinbase], "536a541fa9393bb3c7000034")
      assert_contains_type(response, Address)
      assert status == :ok
    end
  end

  test "accounts create address", context do
    IO.puts "\nAPI: Accounts -> Create Address"
    use_cassette "accounts_create_address", custom: true do
      {status, response} = Accounts.create_address(context[:coinbase], "536a541fa9393bb3c7000034")
      assert_contains_type(response, Address)
      assert status == :ok
    end
  end

  test "accounts update", context do
    IO.puts "\nAPI: Accounts -> Update Account"
    use_cassette "accounts_update", custom: true do
      {status, response} = Accounts.update(context[:coinbase], "53752d3e46cd93c93c00000c", %{name: "Satoshi Wallet"})
      assert_contains_type(response, Account)
      assert status == :ok
    end
  end
end
