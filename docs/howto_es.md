# Api.Umbrella

`$ source .env` para cargar las variables de entorno

## HOW TO |> Crear una Umbrella App mixta un solo Ecto repo

***
El alcance de esta documentación es solo para la configuración general de las
apps como umbrella.

Para particularidades de cada una revisa su propio README
***

Crear la Umbrella App Base, es donde los esquemas viviran 
* Se crea con `$ mix phx.new app_name --umbrella  --extraflags` para evitar talacha de supervisor tree y configs consecuentes. en contraste al hacerlo con `$ mix new app_name --umbrella --extraflags`
* Se inicia con Api porque es a la que más fácil se le aplican los flags y nos sirva como el concentrador único de schemas

~~~
API n API_WEB ( graphql intención )
  $ mix phx.new api --umbrella --no-html --no-webpack --binary-id --no-dashboard

  $ cd api_umbrella

Crear Panel ( admon web ) se podría crear dentro de apps/ pero esto me resulto más rápido 
  $ mix phx.new admon --live --binary-id --umbrella

Mover el admon_web a nuestra principal
  $ mv admon_umbrella/apps/admon_web apps/
~~~

Cambiar en los archivos de `apps/admon_web` todas las incidencias de la app  `admon`  por `api`  y en controllers,etc `Admon.*`  por `Api.*`   

Incluido pero no limitado, se me pudo escapar alguno documentando, a los siguientes:
~~~
apps/admon_web/mix.exs  en deps
  {:admon, in_umbrella: true},  ==POR==>  {:api, in_umbrella: true},

apps/admon_web/lib/admon_web/telemetry.exs
   summary("admon.repo.query.total_time", unit: {:native, :millisecond}),
==POR==>  
   summary("api.repo.query.total_time", unit: {:native, :millisecond}),

apps/admon_web/test/support/*
Admon.Repo  ==POR==> Api.Repo
  + channel_case.ex
  + conn_case.ex
  + test_helper.exs
~~~

Integrar y adaptar los archivos de `admon_umbrella/config/*.ex` a la principal en `config/*.ex`

por ejemplo en `admon_umbrella/config/config` copiar todas las configs de `admon_web`
y remplazar en ellas `Admon.Repo`  ==POR==> `Api.Repo` y `admon`  por `api`

ejemplo:
~~~
config :admon_web,
ecto_repos: [Admon.Repo],
generators: [context_app: :admon, binary_id: true]
~~~

POR

~~~
config :admon_web,
ecto_repos: [Api.Repo],
generators: [context_app: :api, binary_id: true]
~~~

Y copiarlas a su equivalente ( ver configs de la umbrella en está app para aclarar dudas)


Modificar `config/dev.exs` para usar variables de entorno
~~~
  username: System.get_env("USERNAME"),
  password: System.get_env("PASSWORD"),
  database: System.get_env("DATABASE"),
  hostname: System.get_env("HOSTNAME"),
~~~

+ Y cambia los ports de las apps para que no se encuentren en la misma
+ Configura y carga tus variables de entorno
~~~
$ source .env
~~~

Se puede usar `.env_dev_example` para crear tu propio archivo `.env`

Luego probar desde raiz del proyecto
~~~
Get deps
    $ mix deps.get

Then configure your database and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server
~~~

Si hubo errores, identificar y corregir.

Si todo salio bien deberian correar ambas apps, revisalas en localhost

+ Eliminar Umbrella de dummy
~~~
$ rm -rf admon_umbrella/
~~~

 
