defmodule EpsiPhoenix.Repo.Migrations.CreateAnime do
  use Ecto.Migration

  def change do
    create table(:anime) do
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
