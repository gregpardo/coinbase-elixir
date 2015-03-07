defmodule Coinbase.Address do
  @type t :: %Coinbase.Address {
    address: binary,
    callback_url: binary,
    label: binary,
    created_at: binary
  }

  defstruct [
    :address,
    :callback_url,
    :label,
    :created_at
    ]
end
