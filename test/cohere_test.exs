defmodule CohereTest do
  use ExUnit.Case
  doctest Cohere

  test "greets the world" do
    assert Cohere.hello() == :world
  end
end
