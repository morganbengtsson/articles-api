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

author0 = Repo.insert! %Author{first_name: "John", last_name: "Doe", age: 25, token: "token0"}
author1 = Repo.insert! %Author{first_name: "Jane", last_name: "Doe", age: 49, token: "token1"}

date = ~D[2000-01-01]

Repo.insert! %Article{author_id: author0.id, title: "Article 1", description: "This is an article.", body: "Article 1 body text.", published_date: date}
Repo.insert! %Article{author_id: author0.id, title: "Article 2", description: "This is an article.", body: "Article 2 body text.", published_date: date}
Repo.insert! %Article{author_id: author0.id, title: "Article 3", description: "This is an article.", body: "Article 3 body text.", published_date: date}
Repo.insert! %Article{author_id: author1.id, title:  "Article 4", description: "This is an article.", body: "Article 4 body text.", published_date: date}
Repo.insert! %Article{author_id: author1.id, title: "Article 5", description: "This is an article.", body: "Article 5 body text.", published_date: date}



