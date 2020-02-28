# ArticlesApi

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [localhost:4000/api/articles](http://localhost:4000/api/articles) from your browser.

# Routes

## [/api/authors](http://localhost:4000/api/authors)

This route supports `POST` by posting a new author with the following JSON body:

    {
      "author": {
        "age": 35,
        "first_name": "Morgan",
        "last_name": "Bengtsson"
      }
    }

Which will return:

    {
      "data": {
        "age": 35,
        "first_name": "Morgan",
        "id": 8,
        "last_name": "Bengtsson",
        "token": "SFMyNTY.g3QAAAACZAAEZGF0YWEIZAAGc2lnbmVkbgYA_b9fi3AB.cFs_UAAz_6kcFmHqyDhbpCNTENHn8j1dH8EBRydw6f0"
      }
    }

Where the **token** has to be used for authorization for other requests. By putting it in the authorization header like so:

    Authorization Bearer SFMyNTY.g3QAAAACZAAEZGF0YWEIZAAGc2lnbmVkbgYA_b9fi3AB.cFs_UAAz_6kcFmHqyDhbpCNTENHn8j1dH8EBRydw6f0

 This route also supports GET (by id) and PUT/PATCH, to update an author. The **token** Has to be provided for authorization.


## [/api/articles](http://localhost:4000/api/articles)

This route supports GET, POST, and DELETE. 

For example to POST an article, provide the following JSON body:

    {
      "article": { 
        "body": "Article 1 body text.",
        "description": "This is an article.",
        "published_date": "2000-01-01",
        "title": "Article 1"
      }
    }

The **token** has to be provided for authorization and association to author.
