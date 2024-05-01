defmodule EpsiPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :epsi_phoenix,
    adapter: Ecto.Adapters.Postgres
end
