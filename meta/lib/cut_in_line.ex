defmodule CutInLine do
  @moduledoc false

  defmacro __using__([cutting: cutters]) do
    quote do
      def excuse_us(line) do
        line |> List.insert_at(1, unquote(cutters)) |> List.flatten
      end
    end
  end
end
