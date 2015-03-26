Code.require_file "../test_helper.exs", __DIR__
Code.require_file "../coinbase_setup_helper.exs", __DIR__

defmodule ApplicationsTest do
  import TypeAssertions
  import CoinbaseSetupHelper
  alias Coinbase.API.Applications
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    coinbase_setup("applications")
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
