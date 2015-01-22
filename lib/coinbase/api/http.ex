defmodule Coinbase.API.Http do
  @moduledoc false
  @form_header ["Content-Type": "application/json"]
  @url "https://api.coinbase.com/v1/"
  @options [timeout: 10000]

  def get(coinbase, endpoint) do
    headers = get_headers(coinbase)
    HTTPotion.get(@url <> endpoint, headers, options: @options)
    |> handle_response
  end

  def post(coinbase, endpoint, body \\ []) do
    headers = get_headers(coinbase) |> Enum.concat(@form_header)
    HTTPotion.post(@url <> endpoint, encode_params(body), headers, options: @options)
    |> handle_response
  end

  def put(coinbase, endpoint, body \\ []) do
    headers = get_headers(coinbase) |> Enum.concat(@form_header)
    HTTPotion.put(@url <> endpoint, encode_params(body), headers, options: @options)
    |> handle_response
  end

  def delete(coinbase, endpoint) do
    headers = get_headers(coinbase)
    HTTPotion.delete(@url <> endpoint, headers, options: @options)
    |> handle_response
  end

  defp handle_response(response) do
    case HTTPotion.Response.success?(response) do
      true ->
        {:ok, response.body}
      false ->
        {:error, response.body}
    end
  end

  def encode_params(params) do
    encode_params(params, "")
  end

  def encode_params(params, header) when is_map(params) do
    struct_to_list(params) |> encode_params(header)
  end

  def encode_params(params, header) when is_list(params) do
    params
    |> Enum.map(&get_param_string(%1, header))
    |> Enum.filter(fn(x) -> x != nil end)
                                  |> Enum.join("&")
  end

  def get_param_string({_, nil}, _) do
    nil
  end

  def get_param_string({key, value}, _) when is_map(value) do
    struct_to_list(value) |> encode_params(key)
  end

  def get_param_string({key, value}, _) when is_list(value) do
    encode_params(value, key)
  end

  def get_param_string({key, value}, "") do
    "#{key}=#{value}"
  end

  def get_param_string({key, value}, header) do
    "#{header}[#{key}]=#{value}"
  end

  defp get_headers(coinbase) do
    api_key = Coinbase.api_key(coinbase)
    api_secret = Coinbase.api_secret(coinbase)
    # TODO: Figure out how to make these
    api_signature = ""
    api_nonce = ""
    ["User-Agent": "Elixir", "Connection": "close", "Host": "coinbase.com", "ACCESS_KEY": "#{api_key}", "ACCESS_SIGNATURE": api_signature, "ACCESS_NONCE": api_nonce ]
  end

  defp struct_to_list(struct) do
    Map.drop(struct, [:__struct__]) |> Map.to_list
  end
end

