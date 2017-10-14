defmodule Greetings do
  @moduledoc false

  defmacro __using__(opts) do
    quote do
      def hello do
        "Hello, #{__MODULE__}! You init’d #{unquote(__MODULE__)} with"
          <> " #{unquote(opts |> inspect)}!"
      end
    end
  end
end
