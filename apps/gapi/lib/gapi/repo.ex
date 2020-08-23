defmodule Gapi.Repo do
  use Ecto.Repo,
    otp_app: :gapi,
    adapter: Ecto.Adapters.Postgres
end
