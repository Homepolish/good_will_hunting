defmodule Token do
  @moduledoc false

  @doc """
  Verifies a token for a resource.

  ## Examples

      iex> Token.token_valid?("eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYXBpIl0sImV4cCI6MTUyNjkzMjE0MywiaWF0IjoxNTI0NTEyOTQzLCJpc3MiOiJob21lcG9saXNoLmNvbSIsImp0aSI6IjI3NzNhNWQ4LWI0NDctNGUxZC1iMzhmLWNhMmM5NDAyNDQzMiIsIm5iZiI6MTUyNDUxMjk0Miwic3ViIjoiRGFsdG9uIiwidHlwIjoicmVmcmVzaCJ9.n0CmCoaeemTPLZ3SuFKoWuJUbSSP3H_je6H6bUL2bMxVa2CcaMcSv0NZYmDDYXegQ2nTbHommOLwuX8AeiSdrw")
      true

  """
  @spec token_valid?(String.t) :: boolean
  def token_valid?(token) do
    {status, _claims} = Token.Guardian.decode_and_verify(token)
    status == :ok
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
    Token.Guardian.encode_and_sign(resource, %{aud: ["api"], typ: "refresh"})
  end
end
