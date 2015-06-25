defmodule Coinbase.API.Contacts do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "contacts"
  @as_contact Coinbase.Contact
  @as_key_contacts :contacts

  @doc """
  List emails the user has previously used for autocompletion

  Optional params:
    page (integer): Can be used to page through results
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
    query (string): Optional partial string match to filter contacts
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals) do
    params = add_optionals(%{}, optionals)
    Base.list(coinbase, @endpoint, params, @as_contact, @as_key_contacts)
  end
end
