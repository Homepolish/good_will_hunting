defmodule QueriesTest do
  use ExUnit.Case

  alias Queries.City
  alias Queries.Weather
  alias Queries.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)

    cities_and_weather = [
      {%City{name: "City A", population: 2_000_000}, %Weather{temp_lo: 26, temp_hi: 28}},
      {%City{name: "City B", population: 4000}, %Weather{temp_lo: 28, temp_hi: 41}},
      {%City{name: "City C", population: 2000}, %Weather{temp_lo: 16, temp_hi: 22}},
      {%City{name: "City D", population: 100000}, %Weather{temp_lo: 21, temp_hi: 28}},
      {%City{name: "City E", population: 50000}, %Weather{temp_lo: 26, temp_hi: 32}}
    ]

    Enum.each(cities_and_weather, fn ({city, weather}) ->
      {:ok, city} = Repo.insert(city)
      Repo.insert(%{weather | city_id: city.id})
    end)
  end

  test "big_cities_with_perfect_weather/0" do
    list = Queries.big_cities_with_perfect_weather()
    assert Enum.map(list, &(&1.name)) == ["City A"]
  end

  test "small_cities_or_cold_cities/0" do
    list = Queries.small_cities_or_cold_cities()
    assert Enum.map(list, &(&1.name)) == ["City B", "City C", "City D"]
  end

  test "medium_cities_or_hot_cities_or_cold_small_cities/0" do
    list = Queries.medium_cities_or_hot_cities_or_cold_small_cities()
    assert Enum.map(list, &(&1.name)) == ["City C", "City D", "City E"]
  end
end
