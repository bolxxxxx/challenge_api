defmodule ChaApi.Events.Article do
  use Ecto.Schema
  import Ecto.Changeset
  alias ChaApi.Events.Event

  schema "articles" do
    field :value, :string
    belongs_to(:event, Event)

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:value])
    |> validate_required([:value])
    |> assoc_constraint(:event)
  end
end
