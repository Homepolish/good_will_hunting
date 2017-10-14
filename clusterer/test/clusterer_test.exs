defmodule ClustererTest do
  use ExUnit.Case
  doctest Clusterer

  describe "foo" do
    setup do
      unless Node.alive?(), do: {:ok, _} = Node.start(:bar@localhost, :shortnames)
      # Start foo@localhost
      Port.open(
        {:spawn_executable, "./test/start_helper.sh"},
        [:binary, args: [to_string(Node.get_cookie)]]
      )
      # Let nodes have time to register
      :timer.sleep(1000)
      on_exit fn ->
        Node.stop()
        # Clean up process
        Port.open({:spawn_executable, "./test/stop_helper.sh"}, [:binary])
      end

      :ok
    end

    test "makes a sandwich" do
      resp = :rpc.call(:"foo@localhost", Clusterer, :make_me_a_sandwich, [])

      # Here's our expectation
      assert resp == "foo has made a sandwich."
    end
  end
end
