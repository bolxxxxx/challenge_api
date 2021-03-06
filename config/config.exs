# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cha_api,
  ecto_repos: [ChaApi.Repo]

# POSTGRES
config :cha_api, ChaApi.Repo,
   username: System.get_env("PGUSER"),
   password: System.get_env("PGPASSWORD"),
   hostname: System.get_env("PGHOST"),
   port: System.get_env("PGPORT"),
   database: System.get_env("PGDATABASE"),
   pool_size: 10
#  Docker
config :cha_api, ChaApi.Endpoint,
   http: [ip: {0, 0, 0, 0}, port: 4000]

# Configures the endpoint
config :cha_api, ChaApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AR+K5QfnFTZILos0mbMpw1x3wXBk5mcbbVMH2Y88LeWnXK4R2zCqPzJ/rydpe9r9",
  render_errors: [view: ChaApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ChaApi.PubSub,
  live_view: [signing_salt: "moqrlp45"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :cha_api, ChaApiWeb.Guardian,
  issuer: "cha_api_web",
  secret_key: "CuT1OFIdGI0YH9Ry4Xr7Cm06Q9ti+Rp527h0ZPgukDb3ugQCb7ETiNWLhjZrc4/7"

config :cha_api, ChaApiWeb.AuthAccessPipeline,
  module: ChaApiWeb.Guardian,
  error_handler: ChaApiWeb.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
