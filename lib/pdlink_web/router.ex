defmodule PdlinkWeb.Router do
  use PdlinkWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PdlinkWeb do
    pipe_through :api
    resources "/links", LinkController, except: [:edit]
  end

  scope "/", PdlinkWeb do
    get "/:id", LinkController, :get_and_redirect
  end

  scope "/", PdlinkWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PdlinkWeb do
  #   pipe_through :api
  # end
end
