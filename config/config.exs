# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lifelog,
  ecto_repos: [Lifelog.Repo]

config :arc,
  storage: Arc.Storage.Local, # or Arc.Storage.S3
  bucket: {:system, "AWS_S3_BUCKET"} # if using Amazon S3

# Configures the endpoint
config :lifelog, LifelogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mr4MLseRVCPRanThYyH1ikkH272S6nYxyK9mKCNl2vg4WMVq0WWghuU/iWpt+E0z",
  render_errors: [view: LifelogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Lifelog.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "+sgPm/xGKXc9YsvvaHgu1uezzF/Vp17+0iqcFnn8/0NEvlyLbrOYTX0MDR4FyD+c"]


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
