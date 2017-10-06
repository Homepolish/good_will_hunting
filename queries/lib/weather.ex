defmodule Queries.Weather do
  use Ecto.Schema

  schema "weather" do
    field :city_id, :integer
    field :temp_lo, :integer, default: 0
    field :temp_hi, :integer, default: 0
    field :temp_unit, :string, default: "c"

    timestamps()
  end
end
