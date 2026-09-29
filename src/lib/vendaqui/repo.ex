defmodule Vendaqui.Repo do
  use Ecto.Repo,
    otp_app: :vendaqui,
    adapter: Ecto.Adapters.Postgres
end
