defmodule Coinbase do
  use GenServer

  @type status :: :ok | :error
  @type response :: {status, map}

  defmodule Config do
    @type t %Config{
      api_key: binary,
      api_secret: binary
    }
    defstruct [:api_key, :api_secret]
  end

  @moduledoc """
  This module defines the Coinbase API.

  This module is based off of balanced-elixir. Most of the coding
  style mimics bryanjos' implementation of his API.

  Documentation for the API can be found here...
  https://www.coinbase.com/docs/api/overview

  Looks for application variables in the `:coinbase` app 
  named :api_key and :api_secret.

  ```
  {:ok, coinbase} = Coinbase.new
  ```
  #alternatively, you can pass in the key and secret
  ```
  {:ok, coinbase} = Coinbase.new({"my_key", "my_secret"})
  ```
  #then pass in the coinbase pid when calling functions
  ```
  {status, response} = Coinbase.Users.Self.get(coinbase)
  ```
  status is either `:ok` or `:error`

  response is a Map converted from the json response from Coinbase.
  """

  @doc """
  Creates a new Coinbase process
  """
@spec new({string, string}) :: { Coinbase.status, pid }
  def new({api_key, api_secret}) do
    start_link(%Config{api_key: api_key, api_secret: api_secret})
  end

  @doc """
  Creates a Coinbase process, reading the key and secret from config or environment variables
  """
@spec new() :: {Coinbase.status, pid}
  def new() do
    api_key = Application.get_env(:coinbase, :api_key, System.get_env("COINBASE_API_KEY"))
    api_secret = Application.get_env(:coinbase, :api_secret, System.get_env("COINBASE_API_SECRET"))
    new({api_key, api_secret})
  end

  def start_link(config) do
    GenServer.start_link(__MODULE__, config)
  end

  @doc """
  Returns the API key
  """
@spec api_key(pid) :: string
  def api_key(coinbase) do
    configuration(coinbase).api_key
  end

  @doc """
  Returns the API secret
  """
@spec api_secret(pid) :: string
  def api_secret(coinbase) do
    configuration(coinbase).api_secret
  end

  @doc """
  Returns the Coinbase config struct
  """
@spec configuration(pid) :: Coinbase.Config.t
  def configuration(coinbase) do
    GenServer.call(coinbase, :get_configuration)
  end

  def init(config) do
    {:ok, config}
  end

  @doc false
  def handle_call(:get_configuration, _from, config) do
    {:reply, config, config}
  end
end

