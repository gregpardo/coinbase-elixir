defmodule Coinbase.API.Withdrawals do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "withdrawals"
  @data_struct Coinbase.Transfer
  @search_key String.to_atom(@endpoint)

  @doc """
  Withdraw USD or EUR

  Optional params:
    commit (boolean): Defaults to true. If set to false, this sell will not be immediately completed. Use the Coinbase.API.Transfers.commit(pid, id) call to complete it
  """
  @spec withdraw(pid, binary, binary, binary, map) :: Coinbase.response
  def withdraw(coinbase, account_id, payment_method_id, amount, optionals \\ %{}) do
    params = %{account_id: account_id, payment_method_id: payment_method_id, amount: amount}
    params = add_optionals(params, optionals)
    Base.post(coinbase, @endpoint, params, @data_struct, @search_key)
  end
end
