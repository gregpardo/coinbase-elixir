defmodule Coinbase.Buy do
  @type t :: %Coinbase.Buy {
            account_id: binary,
            qty: binary,
            currency: binary,
            agree_btc_amount_varies: boolean,
            commit: boolean,
            payment_method_id: binary
        }

  defstruct [
    :account_id,
    :qty,
    :currency,
    :agree_btc_amount_varies,
    :commit,
    :payment_method_id
  ]
end
