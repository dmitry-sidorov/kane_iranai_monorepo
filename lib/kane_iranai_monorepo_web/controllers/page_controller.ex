defmodule KaneIranaiMonorepoWeb.PageController do
  use KaneIranaiMonorepoWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
