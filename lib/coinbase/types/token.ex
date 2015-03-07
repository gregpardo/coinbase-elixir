defmodule Coinbase.Token do
  @type t :: %Coinbase.Token {
    token_id: binary,
    address: binary
  }

  defstruct [
    :token_id,
    :address
    ]
end
