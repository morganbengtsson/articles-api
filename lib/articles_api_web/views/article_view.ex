defmodule ArticlesApiWeb.ArticleView do
  use ArticlesApiWeb, :view
  alias ArticlesApiWeb.ArticleView

  def render("index.json", %{articles: articles}) do
    %{data: render_many(articles, ArticleView, "article.json")}
  end

  def render("show.json", %{article: article}) do
    %{data: render_one(article, ArticleView, "article.json")}
  end

  def render("article.json", %{article: article}) do
    %{id: article.id,
      title: article.title,
      description: article.description,
      body: article.body,
      published_date: article.published_date,
      author: render_one(article.author, ArticlesApiWeb.AuthorView, "author.json")
     }
  end
end
