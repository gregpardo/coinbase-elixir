defmodule Coinbase.Signature do
  @type t :: %Coinbase.Signature {
    position: integer,
    signatures: map
  }

  defstruct [
    :position,
    :signatures
    ]
end
