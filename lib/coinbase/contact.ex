defmodule Coinbase.Contact do
  @type t :: %Coinbase.Contact {
            email: binary
        }

  defstruct [
    :email
  ]
end
