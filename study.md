# ZOTONIC
Framework integrando erlang, JS, HTML e PostgresSQL

---
### Dispatch

São regras que roteiam requests para os controllers.

Funcionam a partir de um pattern matching que compara a URL de uma requisição do navegador.
Ao encontrar a regra que equivale à URL da requisição, redireciona a requisição ao controler
para que seja tratada.

```erlang
%% Examplo
[
    {home,      [],                         controller_page,  [ {template, "home.tpl"}, {id, page_home} ]},
    {features,  ["features"],               controller_page,  [ {template, "features.tpl"}, {id, page_features} ]},
    {collection,["collection", id, slug],   controller_page,  [ {template, "collection.tpl"} ]},
    {category,  ["category", id, slug],     controller_page,  [ {template, "category.tpl"} ]},
    {documentation, ["documentation", id, slug], controller_page, [ {template, "documentation.tpl"} ]}
].
```

**Anatomia das regras:**
- Nome da regra
  - Utilizado para criar URLs (função extra do dispatch)
- Rota para pattern matching com URL do request
  - Strings para partes fixas
  - Átomos para argumentos de URL (como ID's)
    - Os átomos podem ser acessados com q.%nome%, uma 
        variável disponibilizada por padrão dentro do template que for renderizado
  - Átomo '*' para desconsiderar o resto da URL
- Controller responsável
- Argumentos que serão passados ao controller (opcional)
  - Exemplo: template .tpl a ser renderizado

**Regras de aceitação de átomos:**

Na declaração de átomos, podemos utilizar regras de regex e
outras regras deifinidas pela linguagem para limitar o aceite.

```erlang
{foo, ["foo", {id, "^[0-9]+$", [notempty]}], controller_foo, []}
```

**Geração de URL**

To-do

---
### Conttroller

São módulos erlang que definem o que acontece quando uma página é acessada pelo navegador. 

Quando uma regra de dispatch é ativada e um controller é chamado, a chamada de funções 
é iniciada.
Elas são verificadas pela Cowmachine (um wrapper de Webmachine), que as chama de aoordo
um fluxo definido de funções. Algumas delas:

| Callback                   | Para quê serve                                       |
| -------------------------- | ---------------------------------------------------- |
| `resource_exists/1`        | Verifica se o recurso existe. Se não, retorna 404.   |
| `allowed_methods/1`        | Define os métodos HTTP permitidos (GET, POST, etc.). |
| `process/4`                | Lida com o corpo da requisição e retorna a resposta. |
| `content_types_provided/1` | Indica os tipos de conteúdo suportados.              |
| `forbidden/1`              | Verifica se o acesso é permitido.                    |


**Exemplo**
```erlang
% Exemplo de controller para renderizar uma página
-module(controller_example).

-export([ process/4 ])

process(_Method, _AcceptedCT, _ProvidedCT, Context) ->
    % foo e bam estarão no template
    Vars = [
       {foo, <<"bar">>},
       {bam, 1234}
    ],
    z_template:render_to_iolist("mytemplate.tpl", Vars, Context).
```
Considerando a seguinte regra de dispatch:
```erlang
{example_url, [ "example" ], controller_example, []},
```

Quando acessarmos a página '*/example', o controlador controller_example é chamado e a função process/4 é executada.

**Anatomia do controller**

### Modules


### Templates


### Wires


### Resources




### WIRES

submit
postback -> precisa de dispatch

CLICK -> controller -> return context

### FORMS

VALIDATE -> checking before submit

### COMUNICAÃO

Via MQTT

Ação -> MQTT -> server -> contexto em MQTT -> Resposta 

Publish/subscribe -> evita múltiplas reservas, notifica multiplos usuários em caso de mudança na página

### API

m_get, post, delete
podem ser acessados por API

URL sem conf acesso

#### CUIDADOS
banco multi-acess
salva acesso atual, retorna dados baseados no acesso (só dados permitidos)
tomar cuidado para não vazar dados de outros clintes

### TRANSPORT

websocket

user -> user
sessão -> dispositivo
pages -> pages carregadas na sessão

## Estudo