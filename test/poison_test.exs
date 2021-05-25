defmodule PoisonTest do
  use ExUnit.Case
  doctest Poison

  test "greets the world" do
    assert Poison.hello() == :world
  end
end
