ExUnit.start

defmodule TypeAssertions do
  import ExUnit.Assertions

  def assert_contains_type(list, type) when is_list(list) do
    assert List.first(list).__struct__ == type
  end

  def assert_contains_type(obj, type) do
    assert obj.__struct__ == type
  end
end
