defmodule Coinbase.API.Base do
  alias Coinbase.API.Http

  @moduledoc false

  def get(balanced, endpoint, id, struct, collection_name) do
    Http.get(balanced, "#{endpoint}/#{id}")
    |> to_response(struct, collection_name)
  end

  def post(balanced, endpoint, data, struct, collection_name) do
    Http.post(balanced, endpoint, data)
    |> to_response(struct, collection_name)
  end

  def post(balanced, endpoint, struct, collection_name) do
    post(balanced, endpoint, %{}, struct, collection_name)
  end

  def put(balanced, endpoint, data, struct, collection_name) do
    Http.put(balanced, endpoint, data)
    |> to_response(struct, collection_name)
  end

  def put(balanced, endpoint, struct, collection_name) do
    put(balanced, endpoint, %{}, struct, collection_name)
  end

  def delete(balanced, endpoint, id, struct, collection_name) do
    Http.delete(balanced, "#{endpoint}/#{id}")
    |> to_response(struct, collection_name)
  end

  def list(balanced, endpoint, params, struct, collection_name) do
    params = Http.encode_params(params)
    Http.get(balanced, "#{endpoint}?#{params}")
    |> to_response(struct, collection_name)
  end

  def to_response({:error, error}, _, _) do
    {:error, error}
  end

  def to_response({status, ""}, _, _) do
    {status, nil}
  end

  def to_response({status, response}, struct, collection_name) do
    { status, decode_response(response, collection_name, struct) }
  end

  defp decode_response(response, collection_name, struct) do
      JSX.decode!(response)
  end

end
