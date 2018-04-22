defmodule Token.Guardian do
  @moduledoc false
  use Guardian, otp_app: :token

  def subject_for_token(resource, _claims) do
    {:ok, resource}
  end

  def resource_from_claims(claims) do
    {:ok, %{name: claims["sub"]}}
  end
end



  # 1) doctest Token.token_valid?/1 (2) (TokenTest)
  #    test/token_test.exs:3
  #    Doctest failed
  #    code: Token.token_valid?("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYXBpIl0sImV4cCI6MTUwOTcwNTcyOSwiaWF0IjoxNTA3Mjg2NTI5LCJpc3MiOiJob21lcG9saXNoLmNvbSIsImp0aSI6IjhiMjY2OWNmLWEwNzItNDE0Zi1iMjgwLTcxYTU0MTFlZjc4OSIsIm5iZiI6MTUwNzI4NjUyOCwic3ViIjoiRGFsdG9uIiwidHlwIjoiYWNjZXNzIn0.a-bWuUABLoVrDo0EkJ_RWxYCPjBqfecdKW1ScJ1tFQ8") === true
  #    left: :not_implemented
  #    stacktrace:
  #      lib/token.ex:9: Token (module)



  # 2) doctest Token.get_token/1 (1) (TokenTest)
  #    test/token_test.exs:3
  #    Doctest failed: got MatchError with message "no match of right handside value: :not_implemented"
  #    code: {:ok, _token, claims} = Token.get_token("Dalton")
  #           {claims, _} = Map.split(claims, ["aud", "sub", "typ"])
  #           claims
  #    stacktrace:
  #      (for doctest at) lib/token.ex:23: (test)

