Code.require_file "../test_helper.exs", __DIR__
Code.require_file "../coinbase_setup_helper.exs", __DIR__

defmodule BuysTest do
  import TypeAssertions
  import CoinbaseSetupHelper
  alias Coinbase.API.Buys
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    coinbase_setup("buys")
  end

  test "buys buy", context do
    IO.puts "\nAPI: Buys -> Buy"
    use_cassette "buys_buy", custom: true do
      {status, response} = Buys.buy(context[:coinbase])
      assert_contains_type(response, Coinbase.Transfer)
      assert status == :ok
    end
  end
end
