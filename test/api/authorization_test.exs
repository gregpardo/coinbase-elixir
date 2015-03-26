Code.require_file "../test_helper.exs", __DIR__
Code.require_file "../coinbase_setup_helper.exs", __DIR__

defmodule AuthorizationTest do
  import TypeAssertions
  import CoinbaseSetupHelper
  alias Coinbase.API.Authorization
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    coinbase_setup("authorization")
  end

  test "authorization get", context do
    IO.puts "\nAPI: Authorization -> Get"
    use_cassette "authorization_get", custom: true do
      {status, response} = Authorization.get(context[:coinbase])
      assert_contains_type(response, Coinbase.Authorization)
      assert status == :ok
    end
  end
end
