defmodule Coinbase.Currency do
  @type t :: %Coinbase.Currency {
            name: binary,
            abbreviation: binary
        }

  defstruct [
    :name,
    :abbreviation
  ]
end
