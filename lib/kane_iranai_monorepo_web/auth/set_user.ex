defmodule KaneIranaiMonorepoWeb.Auth.SetUser do
  import Plug.Conn
  alias KaneIranaiMonorepoWeb.Auth.ErrorResponse
  alias KaneIranaiMonorepoWeb.Auth.Guardian

  def init(_opts), do: %{}

  def call(conn, _opts) do
    case Guardian.Plug.current_resource(conn) do
      nil -> raise ErrorResponse.Unathorized
      user -> assign(conn, :user, user)
    end
  end
end
