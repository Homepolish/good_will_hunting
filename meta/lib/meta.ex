defmodule Meta do
  @moduledoc """

  Overengineering Hello World, and other fun tasks.

  ## Examples

      iex> Meta.hello
      "Hello, Elixir.Meta! You init’d Elixir.Greetings with [foo: :bar]!"

      iex> Meta.excuse_us([:a, :b, :c])
      [:a, :x, :y, :z, :b, :c]

  """

  use Greetings, [foo: :bar]
  use CutInLine, [cutting: [:x, :y, :z]]
end
