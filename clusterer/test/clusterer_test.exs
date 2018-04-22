defmodule ClustererTest do
  use ExUnit.Case
  doctest Clusterer

  describe "foo" do
    setup do
      unless Node.alive?(), do: {:ok, _} = Node.start(:bar@localhost, :shortnames)
      # Start foo@localhost

      ##https://hexdocs.pm/elixir/Node.html#get_cookie/0
      Port.open({:spawn_executable, "./test/start_helper.sh"}, [:binary, args: [to_string(Node.get_cookie)]])
      # Let nodes have time to register
      :timer.sleep(1000)
      on_exit fn ->
        Node.stop()
        # Clean up process
        
        Port.open({:spawn_executable, "./test/stop_helper.sh"}, [:binary]) 
      end

      :ok
    end

#https://github.com/elixir-lang/elixir/issues/2422

    test "makes a sandwich" do

    #http://erlang.org/doc/man/rpc.html#call-4
      resp = :rpc.call(:"foo@localhost", Clusterer, :make_me_a_sandwich, [])

      # Here's our expectation
      assert resp == "foo has made a sandwich."
    end
  end
end

  # 1) doctest Clusterer.nodes/0 (2) (ClustererTest)
  #    test/clusterer_test.exs:3
  #    Doctest failed
  #    code: Clusterer.nodes() === [:nonode@nohost]