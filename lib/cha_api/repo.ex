defmodule ChaApi.Repo do
  use Ecto.Repo,
    otp_app: :cha_api,
    adapter: Ecto.Adapters.Postgres
end
