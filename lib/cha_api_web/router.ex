defmodule ChaApiWeb.Router do
  use ChaApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_as_user do
    plug :accepts, ["json"]
    plug ChaApiWeb.AuthAccessPipeline
  end

  scope "/api", ChaApiWeb do
    pipe_through :api

    post("/user/sign_in", User.SessionController, :create)

    resources "/events", EventController do
      resources "/articles", ArticleController
    end
  end

  scope "/api", ChaApiWeb do
    pipe_through :api_as_user

    post "/events", EventController do
      resources "/articles", ArticleController
    end
  end
end
