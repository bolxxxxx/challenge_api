defmodule ChaApi.CreateUser do
  #create a new user
  import Ecto.Changeset
  alias ChaApi.Repo
  alias ChaApi.User

  def run(params) do
    %User{}
    |> cast(params, [:name, :email, :passw])
    |> validate_required([:name, :email, :passw])
    |> put_password()
    |> Repo.insert()
  end

  defp put_password(%Ecto.Changeset{valid?: true, changes: %{passw: passw}} = changeset) do
    put_change(changeset, :password, Bcrypt.hash_pwd_salt(passw))
  end

  defp put_password(changeset), do: changeset
end
