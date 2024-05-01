defmodule EpsiPhoenix.AnimesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EpsiPhoenix.Animes` context.
  """

  @doc """
  Generate a anime.
  """
  def anime_fixture(attrs \\ %{}) do
    {:ok, anime} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> EpsiPhoenix.Animes.create_anime()

    anime
  end
end
