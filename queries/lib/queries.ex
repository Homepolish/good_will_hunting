defmodule Queries do
  @moduledoc false
  import Ecto.Query
  alias Queries.{Repo, City, Weather}
  
  @doc """
  Returns list of cities with temp >= 24c and temp <= 30c, and pop > 1_000_000.
  """
  def big_cities_with_perfect_weather() do
    Repo.all(
      from city in City,
      join: temp in Weather, on: temp.city_id == city.id,
      where: temp.temp_lo >= 24 and temp.temp_hi <= 30 and city.population > 1_000_000
    )  
  end

  @doc """
  Returns list of cities with temp < 24c, or pop < 5_000.
  """
  def small_cities_or_cold_cities() do
    Repo.all(
      from city in City,
      join: temp in Weather, on: temp.city_id == city.id,
      where: temp.temp_lo < 24 or city.population < 5_000
    )
  end

  @doc """
  Returns list of cities with pop > 5000 and < 1_000_000,
  or temp > 30c, or pop < 5_000 and temp < 24c.

  Note: Try something other than `or` clauses for this query.
  """
  def medium_cities_or_hot_cities_or_cold_small_cities() do
    City
    |> join(:inner, [city], temp in Weather, city.id == temp.city_id)
    |> where([city], city.population > 5_000 and city.population < 1_000_000)
    |> or_where([city, temp], temp.temp_lo > 30)
    |> or_where([city, temp], city.population < 5_000 and temp.temp_lo < 24)
    |> Repo.all
  end
end
