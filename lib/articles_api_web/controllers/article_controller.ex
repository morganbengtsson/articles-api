defmodule ArticlesApiWeb.ArticleController do
  use ArticlesApiWeb, :controller

  alias ArticlesApi.Articles
  alias ArticlesApi.Articles.Article
  alias ArticlesApi.Authors

  action_fallback ArticlesApiWeb.FallbackController

  def index(conn, _params) do
    articles = Articles.list_articles()
    render(conn, "index.json", articles: articles)
  end

  def create(conn, %{"article" => article_params}) do
    auth = get_req_header(conn, "authorization") 
    if auth == [] do
      put_status(conn, 401) |> render(ArticlesApiWeb.ErrorView, "401.json", %{message: "Not authorized"})
    else
      author = Authors.get_author_by_token(auth |> List.first |> String.split(" ") |> List.last)
      if (author == nil) do
        put_status(conn, 403) |> render(ArticlesApiWeb.ErrorView, "403.json", %{message: "Forbidden to do that"})
      else      
        with {:ok, %Article{} = article} <- Articles.create_article(Map.put(article_params, "author_id", author.id)) do
          conn
          |> put_status(:created)
          |> put_resp_header("location", Routes.article_path(conn, :show, article))
          |> render("show.json", article: article)
        end
      end
    end
  end

  def show(conn, %{"id" => id}) do
    article = Articles.get_article!(id)
    render(conn, "show.json", article: article)
  end

  def delete(conn, %{"id" => id}) do
    article = Articles.get_article!(id)
    auth = get_req_header(conn, "authorization") 
    if auth == [] || auth |> List.first |> String.split(" ") |> List.last != article.author.token do
      put_status(conn, 403) |> render(ArticlesApiWeb.ErrorView, "403.json", %{message: "Forbidden to do that"})
    else
      with {:ok, %Article{}} <- Articles.delete_article(article) do
        send_resp(conn, :no_content, "")
      end
    end
  end
end
