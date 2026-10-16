defmodule KaneIranaiMonorepoWeb.NotFoundController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use KaneIranaiMonorepoWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:not_found)
    |> render_inertia("NotFoundPage")
  end
end
