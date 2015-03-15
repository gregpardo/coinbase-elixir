defmodule Coinbase.API.AccountChanges do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "account_changes"
  @as Coinbase.AccountChange
  @as_key String.to_atom(@endpoint)

  @doc """
  List changes to an account

  Optional params:
    page (integer): Can be used to page through results
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
    account_id (string): Specify which account is used for fetching data. The default is your primary account
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    options = %{as: @as, as_key: @as_key, params: params}
    Base.list(coinbase, @endpoint, options)
  end
end
