defmodule CutInLine do
  @moduledoc false

#https://elixir-lang.org/getting-started/meta/quote-and-unquote.html

    #  Doctest failed
    #  code: Meta.excuse_us([:a, :b, :c]) === [:a, :x, :y, :z, :b, :c]
    #  stacktrace:
    #    lib/meta.ex:11: Meta (module)


  defmacro __using__([cutting: people]) do
    quote do
      def excuse_us(line) do
        cutting = unquote(people)
        [head | tail] = line
        new_line = List.flatten([head, cutting, tail])
      end
    end
  end
end
