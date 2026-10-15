defmodule KaneIranaiMonorepoWeb.RedirectController do
  use KaneIranaiMonorepoWeb, :controller

  def permanent_redirect(conn, _params) do
    redirect(conn, to: ~p"/api")
  end
end
