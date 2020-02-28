defmodule ArticlesApiWeb.AuthorController do
  use ArticlesApiWeb, :controller

  alias ArticlesApi.Authors
  alias ArticlesApi.Authors.Author

  action_fallback ArticlesApiWeb.FallbackController

  def index(conn, _params) do    
    authors = Authors.list_authors()
    render(conn, "index.json", authors: authors)
  end

  def create(conn, %{"author" => author_params}) do
    with {:ok, %Author{} = author} <- Authors.create_author(author_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.author_path(conn, :show, author))
      |> render("created.json", author: author)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Authors.get_author!(id)
    render(conn, "show.json", author: author)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Authors.get_author!(id)
    
    auth = get_req_header(conn, "authorization") 
    if auth == [] || auth |> List.first |> String.split(" ") |> List.last != author.token do
      put_status(conn, 403) |> render(ArticlesApiWeb.ErrorView, "403.json", %{message: "You need to be a team admin"})
    else
      with {:ok, %Author{} = author} <- Authors.update_author(author, author_params) do
        render(conn, "show.json", author: author)
      end
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Authors.get_author!(id)

    with {:ok, %Author{}} <- Authors.delete_author(author) do
      send_resp(conn, :no_content, "")
    end
  end
end
