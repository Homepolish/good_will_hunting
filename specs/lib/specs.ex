defmodule Specs do
  @moduledoc false

  @doc """
  Uses Foo to Bar a Baz with a Qux.

  ## Examples

      iex> Specs.foo_bar(:baz, override_qux: false)
      %Bar{atom: true, qux: 0}

      iex> Specs.foo_bar("baz", override_qux: true)
      %Bar{atom: false, qux: 1}

      iex> Specs.foo_bar(1, override_qux: true)
      {:error, "Baz should be atom or string!"}

  """
  @spec foo_bar(String.t, [override_qux: boolean]) :: {:error, binary}
  def foo_bar(baz, override_qux: false), do: Foo.bar(%{baz: baz})
  def foo_bar(baz, override_qux: true), do: Foo.bar(%{baz: baz}, qux: 1)

end
