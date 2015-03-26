Code.require_file "../test_helper.exs", __DIR__
Code.require_file "../coinbase_setup_helper.exs", __DIR__

defmodule AddressesTest do
  import TypeAssertions
  import CoinbaseSetupHelper
  alias Coinbase.API.Addresses
  alias Coinbase.Address
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    coinbase_setup("addresses")
  end

  test "addresses list", context do
    IO.puts "\nAPI: Addresses -> List"
    use_cassette "addresses_list", custom: true do
      {status, response} = Addresses.list(context[:coinbase])
      assert_contains_type(response.addresses, Address)
      assert status == :ok
    end
  end

  test "addresses get", context do
    IO.puts "\nAPI: Addresses -> Get"
    use_cassette "addresses_get", custom: true do
      {status, response} = Addresses.get(context[:coinbase], "503c46a4f8182b10650000ad")
      assert_contains_type(response, Address)
      assert status == :ok
    end
  end
end
