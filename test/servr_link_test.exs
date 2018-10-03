defmodule ServrLinkTest do
  use ExUnit.Case
  doctest ServrLink

  test "greets the world" do
    assert ServrLink.hello() == :world
  end
end
