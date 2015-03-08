defmodule Coinbase.API.Applications do
  alias Coinbase.API.Base
  import Coinbase.Util.Params

  @endpoint "oauth/applications"
  @data_struct Coinbase.Application
  @collection_name :applications

  @doc """
  List OAuth applications

  Optional params:
    page (integer): Can be used to page through results. Default value is 1.
    limit (integer): Number of records to return. Maximum is 1000. Default value is 25.
  """
  @spec list(pid, map) :: Coinbase.response
  def list(coinbase, optionals \\ %{}) do
    params = add_optionals(%{}, optionals)
    Base.list(coinbase, @endpoint, params, @data_struct, @collection_name)
  end

  @doc """
  Show bitcoin address
  """
  @spec get(pid, binary) :: Coinbase.response
  def get(coinbase, id) do
    Base.get(coinbase, @endpoint, id, @data_struct, @collection_name)
  end

  @doc """
  Create an OAuth application
  """
  @spec create(pid, binary, binary) :: Coinbase.response
  def create(coinbase, name, redirect_uri) do
    params = %{application: %{name: name, redirect_uri: redirect_uri}}
    Base.post(coinbase, @endpoint, params, @data_struct, @collection_name)
  end
end
