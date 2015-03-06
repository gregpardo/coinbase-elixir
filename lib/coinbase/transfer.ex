defmodule Coinbase.Transfer do
  @type t :: %Coinbase.Transfer {
    id: binary,
    created_at: binary,
    fees: map,
    payout_date: binary,
    code: binary,
    transaction_id: binary,
    type: binary,
    status: binary,
    detailed_status: binary,
    btc: map,
    subtotal: map,
    total: map,
    description: binary,
    account: binary,
    payment_method: map
  }

  defstruct [
    :id,
    :created_at,
    :fees,
    :payout_date,
    :code,
    :transaction_id,
    :type,
    :status,
    :detailed_status,
    :btc,
    :subtotal,
    :total,
    :description,
    :account,
    :payment_method
    ]
end
