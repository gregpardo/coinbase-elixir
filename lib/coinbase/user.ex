defmodule Coinbase.User do
  @type t :: %Coinbase.User{
    id: binary,
    name: binary,
    email: binary,
    password: binary,
    referrer_id: binary,
    time_zone: binary,
    native_currency: binary,
    balance: map,
    merchant: map,
    buy_level: number,
    sell_level: number,
    buy_limit: map,
    sell_limit: map
  }

  defstruct [
    :id,
    :name,
    :email,
    :password,
    :referrer_id,
    :time_zone,
    :native_currency,
    :balance,
    :merchant,
    :buy_level,
    :sell_level,
    :buy_limit,
    :sell_limit
  ]

  # Coinbase will error if we pass it extra fields
  # So this creates a new user object with only what we need
  def new(user) do
    %{email: user.email, password: user.password}
  end

end
