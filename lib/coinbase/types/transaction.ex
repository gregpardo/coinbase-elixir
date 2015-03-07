defmodule Coinbase.Transaction do
  @type t :: %Coinbase.Transaction {
    id: binary,
    created_at: binary,
    amount: map,
    request: boolean,
    status: binary,
    sender: map,
    recipient: map
  }

  defstruct [
    :id,
    :created_at,
    :amount,
    :request,
    :status,
    :sender,
    :recipient
    ]
end
