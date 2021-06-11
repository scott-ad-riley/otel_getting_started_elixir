defmodule OtelGettingStartedElixirTest do
  use ExUnit.Case
  doctest OtelGettingStartedElixir

  test "greets the world" do
    assert OtelGettingStartedElixir.hello() == :world
  end
end
