defmodule Coinbase.AccountChange do
  @type t :: %Coinbase.AccountChange {
    id: binary,
    created_at: binary,
    transaction_id: binary,
    confirmed: boolean,
    cache: map,
    amount: map
  }

  defstruct [
    :id,
    :created_at,
    :transaction_id,
    :confirmed,
    :cache,
    :amount
    ]
end
