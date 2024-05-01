defmodule EpsiPhoenixWeb.AnimeHTML do
  use EpsiPhoenixWeb, :html

  embed_templates "anime_html/*"

  @doc """
  Renders a anime form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def anime_form(assigns)
end
