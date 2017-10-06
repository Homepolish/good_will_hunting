defmodule Token.Guardian do
  @moduledoc false
  use Guardian, otp_app: :token

  def subject_for_token(resource, _claims) do
    {:error, :not_implemented}
  end

  def resource_from_claims(claims) do
    {:error, :not_implemented}
  end
end
