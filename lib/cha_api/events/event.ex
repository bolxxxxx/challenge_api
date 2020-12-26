defmodule ChaApi.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias ChaApi.Events.Article

  schema "events" do
    field :title, :string
    has_many(:articles, Article, on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title])
    |> cast_assoc(:articles)
    |> validate_required([:title])
  end
end
