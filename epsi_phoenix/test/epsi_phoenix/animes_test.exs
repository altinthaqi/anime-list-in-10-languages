defmodule EpsiPhoenix.AnimesTest do
  use EpsiPhoenix.DataCase

  alias EpsiPhoenix.Animes

  describe "anime" do
    alias EpsiPhoenix.Animes.Anime

    import EpsiPhoenix.AnimesFixtures

    @invalid_attrs %{title: nil}

    test "list_anime/0 returns all anime" do
      anime = anime_fixture()
      assert Animes.list_anime() == [anime]
    end

    test "get_anime!/1 returns the anime with given id" do
      anime = anime_fixture()
      assert Animes.get_anime!(anime.id) == anime
    end

    test "create_anime/1 with valid data creates a anime" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Anime{} = anime} = Animes.create_anime(valid_attrs)
      assert anime.title == "some title"
    end

    test "create_anime/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animes.create_anime(@invalid_attrs)
    end

    test "update_anime/2 with valid data updates the anime" do
      anime = anime_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Anime{} = anime} = Animes.update_anime(anime, update_attrs)
      assert anime.title == "some updated title"
    end

    test "update_anime/2 with invalid data returns error changeset" do
      anime = anime_fixture()
      assert {:error, %Ecto.Changeset{}} = Animes.update_anime(anime, @invalid_attrs)
      assert anime == Animes.get_anime!(anime.id)
    end

    test "delete_anime/1 deletes the anime" do
      anime = anime_fixture()
      assert {:ok, %Anime{}} = Animes.delete_anime(anime)
      assert_raise Ecto.NoResultsError, fn -> Animes.get_anime!(anime.id) end
    end

    test "change_anime/1 returns a anime changeset" do
      anime = anime_fixture()
      assert %Ecto.Changeset{} = Animes.change_anime(anime)
    end
  end
end
