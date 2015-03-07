defmodule Coinbase.Order do
  @type t :: %Coinbase.Order {
    id: binary,
    created_at: binary,
    status: binary,
    total_btc: map,
    total_native: map,
    custom: binary,
    receive_address: binary,
    button: Coinbase.Button,
    transaction: binary
  }

  defstruct [
    :id,
    :created_at,
    :status,
    :total_btc,
    :total_native,
    :custom,
    :receive_address,
    :button,
    :transaction
    ]
end
