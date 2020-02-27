defmodule ArticlesApiWeb.AuthorView do
  use ArticlesApiWeb, :view
  alias ArticlesApiWeb.AuthorView

  def render("index.json", %{authors: authors}) do
    %{data: render_many(authors, AuthorView, "author.json")}
  end

  def render("show.json", %{author: author}) do
    %{data: render_one(author, AuthorView, "author.json")}
  end

  def render("author.json", %{author: author}) do
    %{id: author.id,
      first_name: author.first_name,
      last_name: author.last_name,
      age: author.age}
  end

  def render("created.json", %{author: author}) do
    %{data: render_one(author, AuthorView, "author_created.json")}
  end

  def render("author_created.json", %{author: author}) do
    %{id: author.id,
      first_name: author.first_name,
      last_name: author.last_name,
      age: author.age, token: author.token}
  end

end
