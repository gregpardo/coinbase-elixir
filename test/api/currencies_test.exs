Code.require_file "../test_helper.exs", __DIR__
Code.require_file "../coinbase_setup_helper.exs", __DIR__

defmodule CurrenciesTest do
  import TypeAssertions
  import CoinbaseSetupHelper
  alias Coinbase.API.Currencies
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    coinbase_setup("currencies")
  end

  test "currencies list", context do
    IO.puts "\nAPI: Currencies -> List"
    use_cassette "currencies_list", custom: true do
      {status, response} = Currencies.list(context[:coinbase])
      # assert_contains_type(response.currencies, Coinbase.Currency)
      assert status == :ok
    end
  end

  test "currencies exchange rates", context do
    IO.puts "\nAPI: Currencies -> Exchange Rates"
    use_cassette "currencies_exchange_rates", custom: true do
      {status, response} = Currencies.exchange_rates(context[:coinbase])
      # assert_contains_type(response.currencies, Coinbase.Currency)
      assert status == :ok
    end
  end
end
