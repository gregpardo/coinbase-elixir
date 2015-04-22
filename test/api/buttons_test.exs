Code.require_file "../test_helper.exs", __DIR__
Code.require_file "../coinbase_setup_helper.exs", __DIR__

defmodule ButtonsTest do
  import TypeAssertions
  import CoinbaseSetupHelper
  alias Coinbase.API.Buttons
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    coinbase_setup("buttons")
  end

  test "buttons create", context do
    IO.puts "\nAPI: Buttons -> Create"
    use_cassette "buttons_create", custom: true do
      {status, response} = Buttons.create(context[:coinbase])
      assert_contains_type(response, Coinbase.Button)
      assert status == :ok
    end
  end

  test "buttons get", context do
    IO.puts "\nAPI: Buttons -> Get"
    use_cassette "buttons_get", custom: true do
      {status, response} = Buttons.get(context[:coinbase])
      assert_contains_type(response, Coinbase.Button)
      assert status == :ok
    end
  end

  test "buttons create order", context do
    IO.puts "\nAPI: Buttons -> Create Order"
    use_cassette "buttons_create_order", custom: true do
      {status, response} = Buttons.create_order(context[:coinbase])
      assert_contains_type(response, Coinbase.Order)
      assert status == :ok
    end
  end

  test "buttons list orders", context do
    IO.puts "\nAPI: Buttons -> List Orders"
    use_cassette "buttons_list_orders", custom: true do
      {status, response} = Buttons.list_orders(context[:coinbase])
      assert_contains_type(response.orders, Coinbase.Order)
      assert status == :ok
    end
  end
end
