defmodule ChaApiWeb.User.SessionView do
  use ChaApiWeb, :view

  def render("session.json", %{user: user, token: token}) do
    %{
      status: "ok",
      data: %{
        name: user.name,
        token: token
      }
    }
  end

end
