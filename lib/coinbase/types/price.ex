defmodule Coinbase.Price do
  @type t :: %Coinbase.Price {
    amount: binary,
    currency: binary
  }

  defstruct [
    :amount,
    :currency
    ]
end
