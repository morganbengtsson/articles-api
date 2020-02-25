defmodule ArticlesApi.Repo do
  use Ecto.Repo,
    otp_app: :articles_api,
    adapter: Ecto.Adapters.Postgres
end
