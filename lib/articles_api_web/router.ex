defmodule ArticlesApiWeb.Router do
  use ArticlesApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ArticlesApiWeb do
    pipe_through :api
    resources "/articles", ArticleController, only: [:index, :create, :delete, :show]    
    resources "/authors", AuthorController, only: [:show, :create, :update]
  end
end
