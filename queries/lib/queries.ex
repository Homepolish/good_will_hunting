defmodule Queries do
  import Ecto.Query
  alias Queries.{Repo, City, Weather}
  @moduledoc false

  @doc """
  Returns list of cities with temp >= 24c and temp <= 30c, and pop > 1_000_000.
  """
  def big_cities_with_perfect_weather() do
    Repo.all(
      from c in City,
      join: w in Weather, on: w.city_id == c.id,
      where: w.temp_lo >= 24 and w.temp_hi <= 30 and c.population > 1_000_000
    )
  end

  @doc """
  Returns list of cities with temp < 24c, or pop < 5_000.
  """
  def small_cities_or_cold_cities() do
    Repo.all(
      from c in City,
      join: w in Weather, on: w.city_id == c.id,
      where: w.temp_lo < 24 or c.population < 5_000
    )
  end

  @doc """
  Returns list of cities with pop > 5000 and < 1_000_000,
  or temp > 30c, or pop < 5_000 and temp < 24c.

  Note: Try something other than `or` clauses for this query.
  """
  def medium_cities_or_hot_cities_or_cold_small_cities() do
    query = City |> join(:inner, [c], w in Weather, c.id == w.city_id)
    medium_cities =
      City
      |> where([c], c.population > 5_000 and c.population < 1_000_000)
      |> Repo.all
    hot_cities = query |> where([c, w], w.temp_lo > 30) |> Repo.all
    cold_small_cities =
      query
      |> where([c, w], c.population < 5_000 and w.temp_lo < 24)
      |> Repo.all

    medium_cities ++ hot_cities ++ cold_small_cities |> Enum.uniq |> Enum.sort
  end
end
