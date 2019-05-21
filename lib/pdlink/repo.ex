defmodule Pdlink.Repo do
  use Ecto.Repo,
    otp_app: :pdlink,
    adapter: Ecto.Adapters.MySQL
end
