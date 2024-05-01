defmodule EpsiPhoenix.Animes.Anime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "anime" do
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(anime, attrs) do
    anime
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
