defmodule Coinbase.API.Users do
  alias Coinbase.API.Base
  alias Coinbase.User

  @endpoint "users"
  @data_struct Coinbase.User
  @collection_name String.to_atom(@endpoint)

  @doc """
  Gets the current user
  """
  @spec get_current(pid) :: Coinbase.response
  def get_current(coinbase) do
    Base.get(coinbase, @endpoint, "self", @data_struct, @collection_name)
  end

  @doc """
  Creates a new user with email and password
  Optionally include client_id and scopes for oauth support
  e.g.
  options = %{client_id: "c044110d72cb725bc94ea4361ab37f312eeda8d27df30d2bcc47825723fcfb58", scopes: "merchant"}
  """
  @spec create(pid, @data_struct.t, map) :: Coinbase.response
  def create(coinbase, user, options \\ %{}) do
    body = Map.merge(%{user: User.new(user)}, options)
    Base.post(coinbase, @endpoint, body, @data_struct, @collection_name)
  end

  @doc """
  Updates a user
  """
  @spec update(pid, map) :: Coinbase.response
  def update(coinbase, user) do
    Base.put(coinbase, "#{@endpoint}/#{user.id}", user, @data_struct, @collection_name)
  end
end
