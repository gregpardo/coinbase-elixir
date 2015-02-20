defmodule Coinbase.Buy do
  @type t :: %Coinbase.Buy {
            account_id: binary,
            qty: string,
            currency: string,
            agree_btc_amount_varies: boolean,
            commit: boolean,
            payment_method_id: string
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
