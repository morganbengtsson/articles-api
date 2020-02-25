defmodule ArticlesApi.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
   create table(:authors) do
      add :first_name, :string
      add :last_name, :string
      add :age, :integer

      timestamps()
    end
    create table(:articles) do
      add :title, :string
      add :description, :string
      add :body, :string
      add :published_date, :date
      add :author_id, references(:authors), null: false

      timestamps()
    end
  end
end
