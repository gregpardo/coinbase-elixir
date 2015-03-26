Code.require_file "../test_helper.exs", __DIR__
Code.require_file "../coinbase_setup_helper.exs", __DIR__

defmodule AccountChangesTest do
  import TypeAssertions
  import CoinbaseSetupHelper
  alias Coinbase.API.AccountChanges
  alias Coinbase.AccountChange
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    coinbase_setup("account_changes")
  end

  test "account changes list", context do
    IO.puts "\nAPI: Account Changes -> List"
    use_cassette "account_changes_list", custom: true do
      {status, response} = AccountChanges.list(context[:coinbase])
      assert_contains_type(response.account_changes, AccountChange)
      assert status == :ok
    end
  end
end
