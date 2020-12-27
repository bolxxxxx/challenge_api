defmodule ChaApi.SignInUser do
  @moduledoc """
  sign in as user
  """
  alias ChaApi.User
  alias ChaApi.Repo

  def run(email, passw) do
    case Repo.get_by(User, email: email) do
      %User{} = user -> verify_password(user, passw)
      nil -> {:error, :email_or_password_invalid}
    end
  end

  defp verify_password(user, passw) do
    if Bcrypt.verify_pass(passw, user.password) do
      {:ok, user}
    else
      {:error, :email_or_password_invalid}
    end
  end

end
