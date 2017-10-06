defmodule Queries.Repo.Migrations.AddWeather do
  use Ecto.Migration

  def change do
    create table(:weather) do
      add :city_id, :integer
      add :temp_lo, :integer, default: 0
      add :temp_hi, :integer, default: 0
      add :temp_unit, :string, default: "c"

      timestamps()
    end
  end
end
