use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sepomex_api, SepomexApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :sepomex_api, SepomexApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "goku",
  password: "dragonball",
  database: "sepomex_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
