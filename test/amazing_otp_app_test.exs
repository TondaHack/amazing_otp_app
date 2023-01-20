defmodule AmazingOtpAppTest do
  use ExUnit.Case
  doctest AmazingOtpApp

  test "greets the world" do
    assert AmazingOtpApp.hello() == :world
  end
end
