defmodule Coinbase.Balance do
  @type t :: %Coinbase.Balance {
    amount: binary,
    currency: binary
  }

  defstruct [
    :amount,
    :currency
    ]
end
