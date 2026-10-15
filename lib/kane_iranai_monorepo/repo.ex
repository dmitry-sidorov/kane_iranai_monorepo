defmodule KaneIranaiMonorepo.Repo do
  use Ecto.Repo,
    otp_app: :kane_iranai_monorepo,
    adapter: Ecto.Adapters.Postgres
end
