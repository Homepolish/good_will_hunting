defmodule Clusterer do
  @moduledoc false

  @doc """
    Returns list of all nodes in cluster.

    iex> Clusterer.nodes()
    [:nonode@nohost]
  """
  @spec nodes() :: list(atom)
  def nodes() do
    [node() | Node.list]
  end

  @doc """
    Says hello from the node.

    iex> Clusterer.make_me_a_sandwich()
    "nonode has made a sandwich."
  """
  def make_me_a_sandwich() do
    name = "#{node()}" |> String.split("@") |> hd
    "#{name} has made a sandwich."
  end
end
