defmodule Coinbase.API.Base do
  alias Coinbase.API.Http

  @moduledoc false

  def get(coinbase, endpoint, id, params, struct, collection_name) do
    get(coinbase, "#{endpoint}/#{id}", params, struct, collection_name)
  end

  def get(coinbase, endpoint, params, struct, collection_name) when is_map(params) do
    params = Http.encode_params(params)
    Http.get(coinbase, "#{endpoint}?#{params}")
    |> to_response(struct, collection_name)
  end

  def get(coinbase, endpoint, id, struct, collection_name) when is_binary(id) do
    get(coinbase, "#{endpoint}/#{id}", %{}, struct, collection_name)
  end

  def post(coinbase, endpoint, data, struct, collection_name) do
    Http.post(coinbase, endpoint, data)
    |> to_response(struct, collection_name)
  end

  def post(coinbase, endpoint, struct, collection_name) do
    post(coinbase, endpoint, %{}, struct, collection_name)
  end

  def put(coinbase, endpoint, data, struct, collection_name) do
    Http.put(coinbase, endpoint, data)
    |> to_response(struct, collection_name)
  end

  def put(coinbase, endpoint, struct, collection_name) do
    put(coinbase, endpoint, %{}, struct, collection_name)
  end

  def delete(coinbase, endpoint, id, struct, collection_name) do
    Http.delete(coinbase, "#{endpoint}/#{id}")
    |> to_response(struct, collection_name)
  end

  def list(coinbase, endpoint, params, struct, collection_name) do
    params = Http.encode_params(params)
    Http.get(coinbase, "#{endpoint}?#{params}")
    |> to_response(struct, collection_name)
  end

  def to_response({:error, error}, _, _) do
    {:error, error}
  end

  def to_response({status, ""}, _, _) do
    {status, nil}
  end

  def to_response({status, response}, struct, collection_name) do
    { status, decode_response(response, struct, collection_name) }
  end

  defp decode_response(response, atom, collection_name) when is_atom(atom) and atom == :none do
    Poison.Parser.parse!(response, keys: :atoms)
  end

  defp decode_response(response, struct, collection_name) do
    map_prototype = Map.new()
      |> Map.put(collection_name, [struct])
      |> Map.put("links", [Map])
      |> Map.put("errors", [Coinbase.Error])

    case map_prototype do
      :none ->
        Poison.Parser.parse!(response, keys: :atoms)
      _ ->
        Poison.decode!(response, keys: :atoms, as: map_prototype)
    end
  end



  def optional_param(map, name, param) do
    unless param == nil do 
      Map.put(map, name, param)
    end
  end
end
