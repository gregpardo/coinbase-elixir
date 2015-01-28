defmodule Coinbase.Authorization do
  @type t :: %Coinbase.Authorization {
    auth_type: binary,
    meta: map,
    scripts: map
  }

  defstruct [
    :auth_type,
    :meta,
    :scripts
    ]
end
