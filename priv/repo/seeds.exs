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

Repo.insert! %Article{title: "Article 1", description: "This is an article.", body: "Article 1 body text.", published_date: ~D[2020-01-01]}
Repo.insert! %Article{title: "Article 2", description: "This is an article.", body: "Article 2 body text.", published_date: ~D[2020-01-02]}
Repo.insert! %Article{title: "Article 3", description: "This is an article.", body: "Article 3 body text.", published_date: ~D[2020-01-03]}
Repo.insert! %Article{title: "Article 4", description: "This is an article.", body: "Article 4 body text.", published_date: ~D[2020-01-04]}
Repo.insert! %Article{title: "Article 5", description: "This is an article.", body: "Article 5 body text.", published_date: ~D[2020-01-05]}
