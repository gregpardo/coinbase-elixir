defmodule Coinbase.Util.Params do

  @moduledoc """
  A utility class to help with parameters
  Adds support for adding additional parameters to a map
  eaily and ignores values of :undefined
  """

  @doc """
  Takes a map and adds optional map params into it
  Ignores pairs with value of :undefined
  """
  @spec add_optionals(map, map) :: map
  def add_optionals(params, optionals \\ %{}) when is_map(optionals) do
    optionals = strip_undefined(optionals)
    Dict.merge(params, optionals, fn(_k, v1, v2) ->
      cond do
        is_map(v1) && is_map(v2) ->
          add_optionals(v1, v2)
        true ->
          v2
      end
    end)
  end

  defp handle_values(v1, v2) when is_map(v1) and is_map(v2) do
    add_optionals(v1, v2)
  end

  defp strip_undefined(dict) when is_map(dict) do
    check_keys_for_undefined(dict, Dict.keys(dict))
  end

  defp check_keys_for_undefined(dict, [head | tail]) do
    dict = check_key_for_undefined(dict, head)
    check_keys_for_undefined(dict, tail)
  end

  defp check_keys_for_undefined(dict, []) do
    dict
  end

  defp check_key_for_undefined(dict, key) do
    value = Dict.get(dict, key)
    if value == :undefined do
      Dict.delete(dict, key)
    else
      if is_map(value) do
        Dict.put(dict, key, strip_undefined(value))
      else
        dict
      end
    end
  end
end
