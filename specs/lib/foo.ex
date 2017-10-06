defmodule Foo do

  @spec bar(map) :: boolean
  def bar(payload, opts \\ [qux: 0]) do
    Bar.baz(payload, opts)
  end
end
