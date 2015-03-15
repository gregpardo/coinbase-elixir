defmodule Coinbase.API.Applications do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "oauth/applications"
  @as_application Coinbase.Application
  @as_key_application :application

  @doc """
  List OAuth applications

  Optional params:
    page (integer): Can be used to page through results. Default value is 1.
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    options = %{as: @as_application, as_key: @as_key_application, params: params}
    Base.list(coinbase, @endpoint, options)
  end

  @doc """
  Show bitcoin address
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    options = %{as: @as_application, as_key: @as_key_application}
    Base.get(coinbase, "#{@endpoint}/#{id}", options)
  end

  @doc """
  Create an OAuth application
  """
  @spec create(pid, map) :: Coinbase.response
  def create(coinbase, application) do
    body = %{application: application}
    options = %{as: @as_application, as_key: @as_key_application, body: body}
    Base.post(coinbase, @endpoint, options)
  end
end
