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
  def add_optionals(params, optional) when is_map(optional) do
    list = Dict.to_list(optional)
    IO.puts inspect(list)
    params |> add_optionals_list(list)
  end

  defp add_optionals_list(params, []) do
    params
  end

  defp add_optionals_list(params, [head | tail]) do
    {key, value} = head
    IO.puts key
    IO.puts value
    params
      |> add_optional(key, value)
      |> add_optionals_list(tail)
  end

  @doc """
  Takes a map and adds optional map params into it
  Ignores pairs with value of :undefined
  """
  @spec add_optional(map, binary, binary) :: map
  def add_optional(params, key, value) when is_atom(key) do
    case value do
      :undefined ->
        params
      _ ->
        params |> Dict.put(key, value)
    end
  end
end
