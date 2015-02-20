defmodule Coinbase.Contact do
  @type t :: %Coinbase.Contact {
            email: string
        }

  defstruct [
    :email
  ]
end
