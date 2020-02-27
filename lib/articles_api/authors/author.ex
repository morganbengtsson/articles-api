defmodule ArticlesApi.Authors.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :age, :integer
    field :first_name, :string
    field :last_name, :string
    field :token, :string
    has_many :articles, ArticlesApi.Articles.Article

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:first_name, :last_name, :age])
    |> validate_required([:first_name, :last_name, :age])
    |> validate_number(:age, greater_than: 13)
  end

  @doc false
  def changeset_token(author, attrs) do
    author
    |> cast(attrs, [:token])
    |> validate_required([:token])
  end
end
