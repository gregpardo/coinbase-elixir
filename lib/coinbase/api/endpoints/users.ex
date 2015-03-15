defmodule Coinbase.API.Users do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "users"
  @data_struct Coinbase.User
  @search_key String.to_atom(@endpoint)

  @doc """
  Gets the current user
  """
  @spec get_current(pid) :: Coinbase.response
  def get_current(coinbase) do
    Base.get(coinbase, "#{@endpoint}/self", %{}, @data_struct, @search_key)
  end

  @doc """
  Create a new user

  NOTE: Coinbase will error if you pass it additional uncessary fields so mark them as :undefined in the object or create a new object with only those fields

  Optional params:
    user[referrer_id] (string): Optional id of the user to get a referral credit in the case that this transaction makes the user eligible. The referring user is eligible for a credit if the address in the ‘to’ field is an email address for which there is currently no registered account and the recipient proceeds to buy or sell at least $100 worth of bitcoin.
    client_id (string): Optional client_id of your OAuth2 api application. When this is provided your application will automatically be granted the ‘merchant’ OAuth2 permission for this user. See more information
    scopes (string): Optional list of authorization scopes your app will obtain for this user, separated by space.
  """
  @spec create(pid, map, map) :: Coinbase.response
  def create(coinbase, user, optionals \\ %{}) do
    params = %{user: user}
    params = add_optionals(params, optionals)
    Base.post(coinbase, @endpoint, params, @data_struct, @search_key)
  end

  @doc """
  Updates the current user
  """
  @spec update(pid, binary, map) :: Coinbase.response
  def update(coinbase, id, user) do
    params = user
    Base.put(coinbase, "#{@endpoint}/#{id}", params, @data_struct, @search_key)
  end
end
