Code.require_file "../test_helper.exs", __DIR__

defmodule ApplicationsTest do
  import TypeAssertions
  alias Coinbase.API.Applications
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/applications", "test/fixtures/applications")
    ExVCR.Config.filter_sensitive_data("Basic\\s.+", "Basic API_SECRET")
    ExVCR.Config.filter_sensitive_data("Basic\\s.+", "Basic API_KEY")
    HTTPoison.start
    fake_api_key = Application.get_env(:coinbase, :api_key, "api_key")
    fake_api_secret = Application.get_env(:coinbase, :api_secret, "api_secret")
    {:ok, coinbase } = Coinbase.new(fake_api_key, fake_api_secret)
    {:ok, [coinbase: coinbase] }
  end

  test "applications list", context do
    IO.puts "\nAPI: Applications -> List"
    use_cassette "applications_list", custom: true do
      {status, response} = Applications.list(context[:coinbase])
      assert_contains_type(response.applications, Coinbase.Application)
      assert status == :ok
    end
  end

  test "applications get", context do
    IO.puts "\nAPI: Applications -> Get"
    use_cassette "applications_get", custom: true do
      {status, response} = Applications.get(context[:coinbase], "52fe8cf2137f733087000002")
      assert_contains_type(response, Coinbase.Application)
      assert status == :ok
    end
  end

  test "applications create", context do
    IO.puts "\nAPI: Applications -> Create"
    use_cassette "applications_create", custom: true do
      {status, response} = Applications.create(context[:coinbase], %{name: "Test App 3", redirect_uri: "http://example.com"})
      assert_contains_type(response, Coinbase.Application)
      assert status == :ok
    end
  end
end
