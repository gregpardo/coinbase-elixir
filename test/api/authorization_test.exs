Code.require_file "../test_helper.exs", __DIR__

defmodule AuthorizationTest do
  import TypeAssertions
  alias Coinbase.API.Authorization
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/authorization", "test/fixtures/authorization")
    ExVCR.Config.filter_sensitive_data("Basic\\s.+", "Basic API_SECRET")
    ExVCR.Config.filter_sensitive_data("Basic\\s.+", "Basic API_KEY")
    HTTPoison.start
    fake_api_key = Application.get_env(:coinbase, :api_key, "api_key")
    fake_api_secret = Application.get_env(:coinbase, :api_secret, "api_secret")
    {:ok, coinbase } = Coinbase.new(fake_api_key, fake_api_secret)
    {:ok, [coinbase: coinbase] }
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
