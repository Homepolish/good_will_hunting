defmodule User do
  @type t :: %__MODULE__{}

  @moduledoc false
  defstruct encrypted_password: ""
end
