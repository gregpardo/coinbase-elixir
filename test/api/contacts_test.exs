Code.require_file "../test_helper.exs", __DIR__
Code.require_file "../coinbase_setup_helper.exs", __DIR__

defmodule ContactsTest do
  import TypeAssertions
  import CoinbaseSetupHelper
  alias Coinbase.API.Contacts
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    coinbase_setup("contacts")
  end

  test "contacts list", context do
    IO.puts "\nAPI: Contacts -> List"
    use_cassette "contacts_list", custom: true do
      {status, response} = Contacts.list(context[:coinbase])
      assert_contains_type(response.contacts, Coinbase.Contact)
      assert status == :ok
    end
  end
end
