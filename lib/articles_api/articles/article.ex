defmodule ArticlesApi.Articles.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :body, :string
    field :description, :string
    field :published_date, :date
    field :title, :string
    belongs_to :author, ArticlesApi.Authors.Author

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :description, :body, :published_date])
    |> validate_required([:title, :body, :published_date])
    |> validate_length(:title, max: 150)
  end
end
