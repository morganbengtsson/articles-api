defmodule ArticlesApiWeb.ArticleControllerTest do
  use ArticlesApiWeb.ConnCase

  alias ArticlesApi.Articles
  alias ArticlesApi.Articles.Article
  alias ArticlesApi.Authors.Author
  alias ArticlesApi.Authors

  @create_attrs %{
    body: "some body",
    description: "some description",
    published_date: ~D[2010-04-17],
    title: "some title",
  }
  @update_attrs %{
    body: "some updated body",
    description: "some updated description",
    published_date: ~D[2011-05-18],
    title: "some updated title",
  }
  @invalid_attrs %{body: nil, description: nil, published_date: nil, title: nil}

  setup_all do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ArticlesApi.Repo)
  end

  def fixture(:article) do
    author = ArticlesApi.Repo.insert! %Author{first_name: "John", last_name: "Doe", age: 25}
    {:ok, article} = Articles.create_article(Map.put(@create_attrs, :author_id, author.id))
    article
  end

  setup %{conn: conn} do
    author = ArticlesApi.Repo.insert! %Author{first_name: "John", last_name: "Doe", age: 25}
    {:ok, conn: put_req_header(conn, "accept", "application/json"), author: author}
  end

  describe "index" do
    test "lists all articles", %{conn: conn} do
      conn = get(conn, Routes.article_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create article" do
    test "renders article when data is valid", %{conn: conn, author: author} do
      conn = post(conn, Routes.article_path(conn, :create), article: Map.put(@create_attrs, :author_id, author.id))
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.article_path(conn, :show, id))

      assert %{
               "id" => id,
               "body" => "some body",
               "description" => "some description",
               "published_date" => "2010-04-17",
               "title" => "some title",
               "author" => author
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.article_path(conn, :create), article: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete article" do
    setup [:create_article]

    test "deletes chosen article", %{conn: conn, article: article} do
      conn = delete(conn, Routes.article_path(conn, :delete, article))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.article_path(conn, :show, article))
      end
    end
  end

  defp create_article(_) do
    article = fixture(:article)
    {:ok, article: article}
  end
end
