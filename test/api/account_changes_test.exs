Code.require_file "../test_helper.exs", __DIR__

defmodule AccountChangesTest do
  import TypeAssertions
  alias Coinbase.API.AccountChanges
  alias Coinbase.AccountChange
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/account_changes", "test/fixtures/account_changes")
    ExVCR.Config.filter_sensitive_data("Basic\\s.+", "Basic API_SECRET")
    ExVCR.Config.filter_sensitive_data("Basic\\s.+", "Basic API_KEY")
    HTTPoison.start
    fake_api_key = Application.get_env(:coinbase, :api_key, "api_key")
    fake_api_secret = Application.get_env(:coinbase, :api_secret, "api_secret")
    {:ok, coinbase } = Coinbase.new(fake_api_key, fake_api_secret)
    {:ok, [coinbase: coinbase] }
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
