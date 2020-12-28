defmodule ChaApiWeb.User.SessionController do
  use ChaApiWeb, :controller

  alias ChaApi.SignInUser
  alias ChaApiWeb.Guardian

  def create(conn, %{"email" => email, "passw" => passw}) do
    case SignInUser.run(email, passw) do

      {:ok, user} ->
        {:ok, token, _} = Guardian.encode_and_sign(user)
        render(conn, "session.json", %{user: user, token: token})

      {:error, _} ->
        conn
        |> put_status(401)
        |> json(%{status: "unauthenticated"})
    end
  end
end
