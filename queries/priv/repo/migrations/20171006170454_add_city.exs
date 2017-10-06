defmodule Queries.Repo.Migrations.AddCity do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :name, :string    
      add :population, :integer, default: 0

      timestamps()
    end

  end
end
