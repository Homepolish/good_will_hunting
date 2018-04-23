defmodule Token.Guardian do
  @moduledoc false
  use Guardian, otp_app: :token

  def subject_for_token(resource, _claims) do
    {:ok, resource}
  end

  def resource_from_claims(%{"sub" => sub} = _claims) do
    {:ok, %{name: sub}}
  end

  def resource_from_claims(_) do
    {:error, :invalid_claim}
  end
end
