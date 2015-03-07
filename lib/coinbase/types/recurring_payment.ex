defmodule Coinbase.RecurringPayment do
  @type t :: %Coinbase.RecurringPayment {
    id: binary,
    type: binary,
    status: binary,
    created_at: binary,
    to: binary,
    from: binary,
    start_type: binary,
    times: integer,
    times_run: integer,
    repeat: binary,
    last_run: binary,
    next_run: binary,
    notes: binary,
    description: binary,
    amount: map
  }

  defstruct [
    :id,
    :type,
    :status,
    :created_at,
    :to,
    :from,
    :start_type,
    :times,
    :times_run,
    :repeat,
    :last_run,
    :next_run,
    :notes,
    :description,
    :amount
    ]
end
