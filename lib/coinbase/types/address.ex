defmodule Coinbase.Address do
  @type t :: %Coinbase.Address {
    address: binary,
    callback_url: binary,
    label: binary
  }

  defstruct [
    :address,
    :callback_url,
    :label
    ]
end
