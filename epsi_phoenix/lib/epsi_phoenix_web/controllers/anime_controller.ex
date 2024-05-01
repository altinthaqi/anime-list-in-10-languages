defmodule EpsiPhoenixWeb.AnimeController do
  use EpsiPhoenixWeb, :controller

  alias EpsiPhoenix.Animes
  alias EpsiPhoenix.Animes.Anime

  def index(conn, _params) do
    anime = Animes.list_anime()
    changeset = Animes.change_anime(%Anime{})
    render(conn, :index, anime_collection: anime, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Animes.change_anime(%Anime{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"anime" => anime_params}) do
    case Animes.create_anime(anime_params) do
      {:ok, _anime} ->
        conn
        |> put_flash(:info, "Anime created successfully.")
        |> redirect(to: ~p"/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    anime = Animes.get_anime!(id)
    render(conn, :show, anime: anime)
  end

  def edit(conn, %{"id" => id}) do
    anime = Animes.get_anime!(id)
    changeset = Animes.change_anime(anime)
    render(conn, :edit, anime: anime, changeset: changeset)
  end

  def update(conn, %{"id" => id, "anime" => anime_params}) do
    anime = Animes.get_anime!(id)

    case Animes.update_anime(anime, anime_params) do
      {:ok, anime} ->
        conn
        |> put_flash(:info, "Anime updated successfully.")
        |> redirect(to: ~p"/anime/#{anime}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, anime: anime, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    anime = Animes.get_anime!(id)
    {:ok, _anime} = Animes.delete_anime(anime)

    conn
    |> put_flash(:info, "Anime deleted successfully.")
    |> redirect(to: ~p"/anime")
  end
end
