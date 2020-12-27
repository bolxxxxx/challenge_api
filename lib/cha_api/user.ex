defmodule ChaApi.User do
  use Ecto.Schema


  schema "users" do
    field :email, :string
    field :name, :string
    field :passw, :string, virtual: true
    field :password, :string

    timestamps()
  end


end
