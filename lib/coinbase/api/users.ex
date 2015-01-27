defmodule Coinbase.API.Users do
  alias Coinbase.API.Base

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
  Optionally include client_id and scopes
  """
  @spec create(pid, @data_struct.t, map) :: Coinbase.response
  def create(coinbase, user, options \\ %{}) do
    body = Map.merge(%{user: new_user(user)}, options)
    Base.post(coinbase, @endpoint, body, @data_struct, @collection_name)
  end

  # Coinbase will error if we pass it extra fields
  # So this creates a new user object with only what we need
  defp new_user(user) do
    %{email: user.email, password: user.password}
  end
end
