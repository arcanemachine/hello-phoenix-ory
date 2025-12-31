import Config

config :hello_ory, auth_client: HelloOry.AuthClients.Ory

config :hello_ory, :elixir_client,
  oauth_client_id: "your_elixir_client_oauth_client_id",
  oauth_client_secret: "your_elixir_client_oauth_client_secret"

config :hello_ory, :elixir_server,
  oauth_client_id: "your_elixir_server_oauth_client_id",
  oauth_client_secret: "your_elixir_server_oauth_client_secret"
