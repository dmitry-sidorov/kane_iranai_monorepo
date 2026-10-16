defmodule KaneIranaiMonorepoWeb.Router do
  use KaneIranaiMonorepoWeb, :router
  use Plug.ErrorHandler

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {KaneIranaiMonorepoWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Inertia.Plug
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :auth do
    plug KaneIranaiMonorepoWeb.Auth.Pipeline
    plug KaneIranaiMonorepoWeb.Auth.SetUser
  end


  scope "/", KaneIranaiMonorepoWeb do
    pipe_through [:browser]
    get "/", PageController, :home

    post "/users/create", UserController, :create
    post "/users/sign_in", UserController, :sign_in

    get "/not-found", NotFoundController, :index
  end

  scope "/", KaneIranaiMonorepoWeb do
    pipe_through [:browser, :auth]
    get "/users/by_id/:id", UserController, :show
    get "/users/current_user", UserController, :current_user
    get "/users/sign_out", UserController, :sign_out
    get "/users/refresh_session", UserController, :refresh_session
    put "/users/update", UserController, :update
    delete "/users/delete", UserController, :delete

    get "/plans", BudgetPlanController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", KaneIranaiMonorepoWeb do
  #   pipe_through :api
  # end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:kane_iranai_monorepo, :dev_routes) do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
