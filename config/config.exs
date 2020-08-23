# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :gapi,
  ecto_repos: [Gapi.Repo]

config :gapi_web,
  ecto_repos: [Gapi.Repo],
  generators: [context_app: :gapi]

# Configures the endpoint
config :gapi_web, GapiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DDVNTJzF7U/EyBPqGKbpjz/e2iR9mSY8QjS5eJPkjua5gKw0/7rEQrGRYmNW2O/A",
  render_errors: [view: GapiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Gapi.PubSub,
  live_view: [signing_salt: "sZz9fgXP"]

config :admin_web,
  ecto_repos: [Gapi.Repo],
  generators: [context_app: :gapi]

# Configures the endpoint
config :admin_web, AdminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Tqyl7MVULQ2wzDgKFyTyjZnBqewbv8iontltqY/fxDQi/2/lJAlMjYKWSsqdCC3n",
  render_errors: [view: AdminWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Gapi.PubSub,
  # live_view: [signing_salt: "jG/Zt9Bo"]
  live_view: [signing_salt: "sZz9fgXP"]


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
