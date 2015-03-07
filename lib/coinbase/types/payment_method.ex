defmodule Coinbase.PaymentMethod do
  @type t :: %Coinbase.PaymentMethod {
    id: binary,
    name: binary,
    can_buy: boolean,
    can_sell: boolean
  }

  defstruct [
    :id,
    :name,
    :can_buy,
    :can_sell
    ]
end
