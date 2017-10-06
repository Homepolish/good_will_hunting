defmodule Queries.City do
  use Ecto.Schema

  schema "cities" do
    field :name, :string    
    field :population, :integer, default: 0

    timestamps()
  end
end
