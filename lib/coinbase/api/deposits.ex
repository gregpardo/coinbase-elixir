defmodule Coinbase.API.Deposits do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "deposits"
  @data_struct Coinbase.Transfer
  @collection_name String.to_atom(@endpoint)

  @moduledoc """
  Deposit USD into a USD wallet. Requires a valid USD wallet and bank account to use.
  """

  @doc """
  Deposit USD

  Required params:
    account_id (string): Specify the account to which to deposit (must be a USD wallet).
    amount (string): The quantiry of USD you would like to deposit.
    payment_method_id (string): THe ID of the payment method that should be used for the deposit. Payment methods can be listed using the Coinbase.API.PaymentMethods.list(pid) API call. The payment method must have the same currency as the wallet you are depositing to.

  Optional params:
    commit (boolean): Defaults to true. If set to false, this deposit will not be immediately completed. Use Coinbase.API.Transfer.commit(pid, id) call to complete it.
  """
  @spec deposit(pid, binary, binary, binary, map) :: Coinbase.response
  def deposit(coinbase, account_id, amount, payment_method_id, optionals \\ %{}) do
    params = %{account_id: account_id, amount: amount, payment_method_id: payment_method_id}
    params = add_optionals(params, optionals)
    Base.post(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

end
