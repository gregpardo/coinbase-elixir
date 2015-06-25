Code.require_file "../test_helper.exs", __DIR__
Code.require_file "../coinbase_setup_helper.exs", __DIR__

defmodule DepositsTest do
  import TypeAssertions
  import CoinbaseSetupHelper
  alias Coinbase.API.Deposits
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    coinbase_setup("deposits")
  end

  test "deposits deposit", context do
    IO.puts "\nAPI: Deposits -> Deposit"
    use_cassette "deposits_deposit", custom: true do
      {status, response} = Deposits.deposit(context[:coinbase])
      assert_contains_type(response, Coinbase.Transfer)
      assert status == :ok
    end
  end
end
