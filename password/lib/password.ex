defmodule Password do
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

#  Doctest failed
#  code: user = %User{encrypted_password: "$2b$12$EJEM1PCRUUETHFBIVnIVt.h7JRydgrzWWOeP6jUKCyH9TtZAClkpG"}
#         Password.valid_password?(user, "leeloo dallas multipass") === true
#  left: :not_implemented
#  stacktrace:
#    lib/password.ex:12: Password (module)


  @spec valid_password?(User.t, String.t) :: boolean
  def valid_password?(user, password) do
    # alias Pbkdf2
    # Pbkdf2.verify_pass(password, user.encrypted_password)
    
    alias Bcrypt
    Bcrypt.verify_pass(password, user.encrypted_password)
  end
end
