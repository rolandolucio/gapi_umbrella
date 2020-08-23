# Gapi.Umbrella

Elixir Umbrella App exercise

Elixir continuous learning SandBox

Initial:
+ Absinthe GraphQL app + Phoenix Admin app  + Ecto app

Wannabe:
+ Add AuthN (JWT & Session)
+ proxy
+ docker env
+ heroku deploy
+ use destilery 


Inspired by: https://github.com/wojtekmach/acme_bank

## Objectives
  * Learn and Evaluate Umbrella Apps as DDD option
  * Adapt & Implement GraphQL Tutorial in Umbrella way (https://www.youtube.com/watch?v=_mU-D6coRf4)
  * Adapt & Implement Phoneix LiveView tutorial in Umbrella way (https://www.youtube.com/watch?v=MZvmYaFkNJI)
  * Phoenix app have to use same Repo (Gapi APP ) as GraphQL
  * ...
  * ...
  * ...




## Instructions

~~~
Load ENV VARS (use .env_dev_example as base)
  $ source .env

For root and subs
  $ mix deps.get 

Root /
  $ mix ecto.migrate

  $ mix phx.server
~~~


GraphQL Server
http://localhost:4000/
http://localhost:4000/graphiql

Admin Server
http://localhost:4001