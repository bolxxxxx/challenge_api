defmodule ChaApi.UserRepo do

  alias ChaApi.User
  alias ChaApi.Repo

  def get_user!(id) do
    Repo.get!(User, id)
  end
end
