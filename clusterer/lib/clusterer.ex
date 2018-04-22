defmodule Clusterer do
  @moduledoc false

  @doc """
    Returns list of all nodes in cluster.

    iex> Clusterer.nodes()
    [:nonode@nohost]
  """
  @spec nodes() :: list(atom)
  def nodes() do
    [node() | Node.list] #https://github.com/elixir-lang/elixir/blob/v1.6.4/lib/elixir/lib/node.ex#L64
  end

  @doc """
    Says hello from the node.

    iex> Clusterer.make_me_a_sandwich()
    "nonode has made a sandwich."
  """
  def make_me_a_sandwich() do
    full = "#{node()}" |> String.split("@")
    [name | tail] = full
    "#{name} has made a sandwich."
  end

end
