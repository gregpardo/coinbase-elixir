defmodule Coinbase.Account do
  @type t :: %Coinbase.Account{
    id: binary,
    name: binary,
    balance: map,
    native_balance: map,
    created_at: binary,
    primary: boolean,
    active: boolean,
    type: binary
  }

  defstruct [
    :id,
    :name,
    :balance,
    :native_balance,
    :created_at,
    :primary,
    :active,
    :type
    ]
end
