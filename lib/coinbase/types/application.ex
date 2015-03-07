defmodule Coinbase.Application do
  @type t :: %Coinbase.Application {
    id: binary,
    created_at: binary,
    name: binary,
    redirect_uri: binary,
    num_users: integer
  }

  defstruct [
    :id,
    :created_at,
    :name,
    :redirect_uri,
    :num_users
    ]
end
