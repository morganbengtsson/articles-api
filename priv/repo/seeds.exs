# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ArticlesApi.Repo.insert!(%ArticlesApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ArticlesApi.Repo
alias ArticlesApi.Articles.Article
alias ArticlesApi.Authors.Author

Repo.insert! %Author{id: 1, first_name: "John", last_name: "Doe", age: 25}
Repo.insert! %Author{id: 2, first_name: "Jane", last_name: "Doe", age: 49}

Repo.insert! %Article{id: 1, author_id: 1, title: "Article 1", description: "This is an article.", body: "Article 1 body text.", published_date: ~D[2020-01-01]}
Repo.insert! %Article{id: 2, author_id: 1, title: "Article 2", description: "This is an article.", body: "Article 2 body text.", published_date: ~D[2020-01-02]}
Repo.insert! %Article{id: 3, author_id: 1, title: "Article 3", description: "This is an article.", body: "Article 3 body text.", published_date: ~D[2020-01-03]}
Repo.insert! %Article{id: 4, author_id: 2, title: "Article 4", description: "This is an article.", body: "Article 4 body text.", published_date: ~D[2020-01-04]}
Repo.insert! %Article{id: 5, author_id: 2, title: "Article 5", description: "This is an article.", body: "Article 5 body text.", published_date: ~D[2020-01-05]}



