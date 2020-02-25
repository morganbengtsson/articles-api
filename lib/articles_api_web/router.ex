defmodule ArticlesApiWeb.Router do
  use ArticlesApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ArticlesApiWeb do
    pipe_through :api
    resources "/articles", ArticleController, only: [:index, :create, :delete]    
    resources "/authors", AuthorController, only: [:show, :update]
  end
end
