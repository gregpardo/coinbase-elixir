defmodule Coinbase.Button do
  @type t :: %Coinbase.Button {
    name: binary,
    type: binary,
    subscription: boolean,
    price_string: binary,
    price_currency_iso: binary,
    custom: binary,
    callback_url: binary,
    description: binary,
    style: binary,
    include_email: boolean
  }

  defstruct [
    :name,
    :type,
    :subscription,
    :price_string,
    :price_currency_iso,
    :custom,
    :callback_url,
    :description,
    :style,
    :include_email
    ]
end
