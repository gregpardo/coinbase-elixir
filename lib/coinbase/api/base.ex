defmodule Coinbase.API.Base do
  alias Coinbase.API.Http
  import Inflex

  @moduledoc false
  @default_options %{as: :none, as_key: :nil, params: %{}, body: %{}}

  def get(coinbase, endpoint, options \\ @default_options) do
    if Dict.has_key?(options, :params) do
      endpoint = attach_params(endpoint, options.params)
    end
    Http.get(coinbase, endpoint)
    |> to_response(options)
  end

  def post(coinbase, endpoint, options \\ @default_options) do
    Http.post(coinbase, endpoint, options.body)
    |> to_response(options)
  end

  def put(coinbase, endpoint, options \\ @default_options) do
    Http.put(coinbase, endpoint, options.body)
    |> to_response(options)
  end

  def delete(coinbase, endpoint, options \\ @default_options) do
    Http.delete(coinbase, endpoint)
    |> to_response(options)
  end

  def list(coinbase, endpoint, options \\ @default_options) do
    endpoint = attach_params(endpoint, options.params)
    options = Dict.put(options, :is_collection, true)
    Http.get(coinbase, endpoint)
    |> to_response(options)
  end

  def attach_params(endpoint, options) do
    params = Dict.get(options, :params)
    params_str = Http.encode_params(params)
    endpoint = "#{endpoint}?#{params_str}"
    endpoint
  end

  def to_response({:error, error}, _) do
    {:error, error}
  end

  def to_response({status, ""}, _) do
    {status, nil}
  end

  def to_response({status, response}, %{as: :none}) do
    { status, decode_response(response, :none) }
  end

  def to_response({status, response}, options) do
    if Dict.has_key?(options, :is_collection) == false do
      options = Dict.put(options, :is_collection, false)
    end
    { status, decode_response(response, options.as, options.as_key, options.is_collection) }
  end

  # No object mapping... just parse the json to plain map
  defp decode_response(response, :none) do
    Poison.Parser.parse!(response, keys: :atoms)
  end

  # Attempt to map the object from the json
  # When not expecting collection
  defp decode_response(response, as, as_key, false) do
    map_prototype = Map.new()
    # We only map to a sub object if it contains that key
    if String.contains?(response, "\\\"#{as_key}\\\":") do
      Map.put(map_prototype, as_key, as)
      Poison.decode!(response, keys: :atoms, as: map_prototype)[as_key]
    else
      Poison.decode!(response, keys: :atoms, as: as)
    end
  end

  # Attempt to map the object from the json
  # When expecting collection
  defp decode_response(response, as, as_key, true) do
    as_key = as_key
      |> Atom.to_string
      |> pluralize
      |> String.to_atom

    map_prototype = Map.new()
      |> Map.put(as_key, [as])
    Poison.decode!(response, keys: :atoms, as: map_prototype)
  end
end
