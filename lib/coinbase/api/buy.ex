defmodule Coinbase.API.Buy do

  @endpoint "buys"
  @data_struct Coinbase.Authorization
  @collection_name String.to_atom(@endpoint)

  @doc """
  Buy bitcoin
  """
  @spec buy(pid, binary, binary, boolean, boolean, binary) :: Coinbase.response
  def buy(coinbase, quantity, account_id \\ nil, currency \\ nil, agree_btc_amount_varies \\ false, commit \\ false, payment_method_id \\ nil) do
    data = %{qty: quantity, agree_btc_amount_varies: agree_btc_amount_varies, commit: commit}
    data = Base.optional_param(data, "account_id", account_id)
    data = Base.optional_param(data, "currency", currency)
    data = Base.optional_param(data, "payment_method_id", payment_method_id)
    Base.post(coinbase, @endpoint, data, @data_struct, @collection_name)
  end

end
