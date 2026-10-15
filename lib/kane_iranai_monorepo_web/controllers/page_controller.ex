defmodule KaneIranaiMonorepoWeb.PageController do
  use KaneIranaiMonorepoWeb, :controller

  def home(conn, _params) do
    conn
    |> assign_prop(:text, "Hello world")
    |> render_inertia("Home")
  end
end
