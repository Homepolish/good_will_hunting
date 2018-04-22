defmodule Token do
  @moduledoc false

  @doc """
  Verifies a token for a resource.

  ## Examples

      iex> Token.token_valid?("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYXBpIl0sImV4cCI6MTUwOTcwNTcyOSwiaWF0IjoxNTA3Mjg2NTI5LCJpc3MiOiJob21lcG9saXNoLmNvbSIsImp0aSI6IjhiMjY2OWNmLWEwNzItNDE0Zi1iMjgwLTcxYTU0MTFlZjc4OSIsIm5iZiI6MTUwNzI4NjUyOCwic3ViIjoiRGFsdG9uIiwidHlwIjoiYWNjZXNzIn0.a-bWuUABLoVrDo0EkJ_RWxYCPjBqfecdKW1ScJ1tFQ8")
      true

  """
  @spec token_valid?(String.t) :: boolean
  def token_valid?(token) do
    {response, _claims} = Token.Guardian.decode_and_verify(token) #https://github.com/ueberauth/guardian/blob/v1.0.1/lib/guardian.ex#L611
    
    case response do
      :ok -> true
      :error -> false
    end
  end

  @doc """
  Creates a token for a resource.

  ## Examples

      iex> {:ok, _token, claims} = Token.get_token("Dalton")
      iex> {claims, _} = Map.split(claims, ["aud", "sub", "typ"])
      iex> claims
      %{"aud" => ["api"], "sub" => "Dalton", "typ" => "refresh"}

  """
  @spec get_token(String.t) :: {:ok, String.t, map}
  def get_token(resource) do

  #https://github.com/ueberauth/guardian/blob/v1.0.1/lib/guardian.ex#L569
    Token.Guardian.encode_and_sign(resource, %{aud: ["api"], typ: "refresh"})
  end
end
