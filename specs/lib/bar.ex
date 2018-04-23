defmodule Bar do
  defstruct qux: 0, atom: false

  @spec baz(map, list) :: {:error, atom | binary}
  def baz(%{baz: baz}, opts) do
    case baz do
      baz when is_atom(baz) -> %Bar{atom: true}
      baz when is_binary(baz) -> %Bar{qux: opts[:qux]}
      _ -> {:error, "Baz should be atom or string!"}
    end
  end
end
