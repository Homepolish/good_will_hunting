defmodule Password do
  require Bcrypt
  @moduledoc false

  @doc """
  Checks to see if supplied password for user is valid.

  ## Examples
      iex> user = %User{encrypted_password: "$2b$12$EJEM1PCRUUETHFBIVnIVt.h7JRydgrzWWOeP6jUKCyH9TtZAClkpG"}
      iex> Password.valid_password?(user, "i am korben dallas")
      false

      iex> user = %User{encrypted_password: "$2b$12$EJEM1PCRUUETHFBIVnIVt.h7JRydgrzWWOeP6jUKCyH9TtZAClkpG"}
      iex> Password.valid_password?(user, "leeloo dallas multipass")
      true
  """
  @spec valid_password?(User.t, String.t) :: boolean
  def valid_password?(user, password) do
    Bcrypt.verify_pass(password, user.encrypted_password)
  end
end
