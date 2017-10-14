defmodule CutInLine do
  @moduledoc false

  defmacro __using__([cutting: cutters]) do
    quote do
      def excuse_us([head | tail]) do
        [head, unquote_splicing(cutters) | tail]
      end
    end
  end
end
