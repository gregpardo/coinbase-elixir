defmodule Coinbase.Currency do
  @type t :: %Coinbase.Contact {
            name: string
            abbreviation: string
        }

  defstruct [
    :name,
    :abbreviation
  ]
end
