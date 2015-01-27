defmodule Coinbase.Util.Crypt do
  def hmac(key, secret) do
    :crypto.hmac(:sha256, key, secret)
    |> :crypto.bytes_to_integer
    |> Integer.to_string(16)
    |> String.downcase
  end
end

