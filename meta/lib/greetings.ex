defmodule Greetings do
  @moduledoc false
  
#inspect documentation https://hexdocs.pm/elixir/Kernel.html#inspect/2

    #  Doctest failed
    #  code: Meta.hello === "Hello, Elixir.Meta! You init’d Elixir.Greetings with [foo: :bar]!"
    #  stacktrace:
    #    lib/meta.ex:8: Meta (module)

  defmacro __using__(keyword_list) do
    quote do
      def hello do
        meta_stuff = unquote(inspect(keyword_list))
        "Hello, Elixir.Meta! You init’d #{unquote(__MODULE__)} with #{meta_stuff}!"  
      end
    end
  end
end
