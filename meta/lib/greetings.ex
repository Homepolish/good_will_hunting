defmodule Greetings do
  @moduledoc false

  defmacro __using__(opts) do
    quote do
      def hello do
        "Hello, Elixir.Meta! You init’d Elixir.Greetings with"
          <> " #{unquote(opts |> inspect)}!"
      end
    end
  end
end
