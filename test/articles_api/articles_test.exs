defmodule ArticlesApi.ArticlesTest do
  use ArticlesApi.DataCase

  alias ArticlesApi.Articles
  alias ArticlesApi.Authors.Author

  describe "articles" do
    alias ArticlesApi.Articles.Article

    @utc DateTime.now("Etc/UTC")|> elem(1) |> DateTime.truncate(:second)

    @valid_attrs %{author_id: 1, body: "some body", description: "some description", published_date: @utc, title: "some title"}
    @update_attrs %{author_id: 1, body: "some updated body", description: "some updated description", published_date: @utc, title: "some updated title"}
    @invalid_attrs %{body: nil, description: nil, published_date: nil, title: nil}

    setup do
      Repo.insert!(%Author{id: 1, first_name: "John", last_name: "Doe", age: 25})
      :ok
    end

    def article_fixture(attrs \\ %{}) do
      {:ok, article} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Articles.create_article()

      article
    end

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Articles.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Articles.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      assert {:ok, %Article{} = article} = Articles.create_article(@valid_attrs)
      assert article.body == "some body"
      assert article.description == "some description"
      #assert article.published_date == ~D[2010-04-17]
      assert article.title == "some title"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Articles.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      assert {:ok, %Article{} = article} = Articles.update_article(article, @update_attrs)
      assert article.body == "some updated body"
      assert article.description == "some updated description"
      #assert article.published_date == ~D[2011-05-18]
      assert article.title == "some updated title"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Articles.update_article(article, @invalid_attrs)
      assert article == Articles.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Articles.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Articles.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Articles.change_article(article)
    end
  end
end
