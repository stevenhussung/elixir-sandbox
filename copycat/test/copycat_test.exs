defmodule CopycatTest do
  use ExUnit.Case
  doctest Copycat

  test "greets the world" do
    assert Copycat.hello() == :world
  end
end
