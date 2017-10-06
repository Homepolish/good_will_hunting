defmodule Queries do
  @moduledoc false

  @doc """
  Returns list of cities with temp >= 24c and temp <= 30c, and pop > 1_000_000.
  """
  def big_cities_with_perfect_weather() do
    :not_implemented
  end

  @doc """
  Returns list of cities with temp < 24c, or pop < 5_000.
  """
  def small_cities_or_cold_cities() do
    :not_implemented
  end

  @doc """
  Returns list of cities with pop > 5000 and < 1_000_000,
  or temp > 30c, or pop < 5_000 and temp < 24c.

  Note: Try something other than `or` clauses for this query.
  """
  def medium_cities_or_hot_cities_or_cold_small_cities() do
    :not_implemented
  end
end
