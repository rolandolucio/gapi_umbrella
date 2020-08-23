# HOW TO

Seperar el ecto de la App para uso como child app
Declarar la primer App como API de red, opengraph 

~~~

Create umbrella phx app,  para tener el supervisor tree 

    $ mix phx.new gapi --umbrella --no-html --no-webpack

We are almost there! The following steps are missing:

    $ cd gapi_umbrella

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server

~~~

Obj: juntar 2 phx apps en umbrella con un solo config

Duplicar para Admin en proyecyo
Mover Admin_web
juntar configs 
cambiar 
tlemetria
y donde Admin.* por Gapi.*
modificar puertos de red para evitar colisiones

resolver conflictos de dependencias en cada mix.exs correspondiente

Inside gapi_web
~~~

$ mix phx.gen.json Accounts User users name:string email:string   

$ mix phx.gen.json Posts Post posts title:string body:text user_id:references:users

~~~

Inside admin_web
~~~

$ mix phx.gen.live Posts Post posts title:string body:text user_id:references:users --no-context --no-schema

~~~

