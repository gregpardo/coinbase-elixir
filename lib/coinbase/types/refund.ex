defmodule Coinbase.Refund do
  @type t :: %Coinbase.Refund {
    id: binary,
    created_at: binary,
    amount_btc: map,
    amount_native: map,
    transfer_id: binary,
    transaction_id: binary,
    refundable: map
  }

  defstruct [
    :id,
    :created_at,
    :amount_btc,
    :amount_native,
    :transfer_id,
    :transfer_id,
    :refundable
    ]
end
