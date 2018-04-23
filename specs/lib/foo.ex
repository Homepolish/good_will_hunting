defmodule Foo do

  @spec bar(map, list) :: map | {:error, binary}
  def bar(payload, opts \\ [qux: 0]) do
    Bar.baz(payload, opts)
  end
end
