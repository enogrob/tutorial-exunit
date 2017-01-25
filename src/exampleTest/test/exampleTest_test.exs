defmodule ExampleTestTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  doctest ExampleTest

  setup_all do
  {:ok, number: 2}
  end

  test "the truth", state do
    assert 1 + 1 == state[:number]
  end

  test "the false" do
    refute 1 + 1 == 3
  end

  test "receives ping" do
    SendingProcess.run(self)
    assert_received :ping
  end

  test "outputs Hello World" do
    assert capture_io(fn -> IO.puts "Hello World" end) == "Hello World\n"
  end
end
