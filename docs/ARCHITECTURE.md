# Arquitetura do Projeto

## 📋 Visão Geral

Este documento descreve as decisões arquiteturais do **VendAqui** e serve como referência para desenvolvedores e ferramentas de IA.

> **Nota sobre IA:** Ao usar IA para gerar código, forneça este documento como contexto para que a IA respeite as decisões arquiteturais do projeto.

## 🏗️ Estrutura de Diretórios

```
vendaqui/
├── .github/                        # Templates e CI/CD
├── docs/                           # Documentação do projeto
│   ├── ARCHITECTURE.md
│   └── adr/                        # Architecture Decision Records
│       └── 0001-linguagem-e-framework.md
└── src/                            # Projeto Phoenix (Elixir)
    ├── mix.exs                     # Dependências e configuração do projeto
    ├── config/                     # Configurações por ambiente
    │   ├── config.exs              # Config base
    │   ├── dev.exs                 # Config desenvolvimento (banco, mailer)
    │   ├── prod.exs                # Config produção
    │   └── runtime.exs             # Config de runtime (env vars)
    ├── lib/
    │   ├── vendaqui/               # Contextos de negócio (lógica de domínio)
    │   │   ├── application.ex      # Supervisor principal OTP
    │   │   ├── repo.ex             # Repositório Ecto (acesso a dados)
    │   │   └── mailer.ex           # Integração de e-mail (Swoosh)
    │   └── vendaqui_web/           # Camada web (Phoenix)
    │       ├── router.ex           # Definição de rotas
    │       ├── endpoint.ex         # Configuração do endpoint HTTP/WS
    │       ├── controllers/        # Controllers (recebem request, retornam response)
    │       ├── components/         # Componentes LiveView e layouts HTML
    │       └── live/               # Módulos LiveView (UI reativa em tempo real)
    ├── priv/
    │   ├── repo/
    │   │   ├── migrations/         # Migrations Ecto (versionamento do banco)
    │   │   └── seeds.exs           # Dados iniciais
    │   └── static/                 # Assets estáticos públicos
    ├── assets/
    │   ├── css/app.css             # Estilos (Tailwind CSS)
    │   └── js/app.js               # JavaScript (ESBuild)
    └── test/                       # Testes ExUnit
        ├── test_helper.exs
        └── vendaqui_web/
```

## 📐 Padrões Arquiteturais

### Camadas da Aplicação

Phoenix segue o padrão **Contexts** para separação de domínio:

```
[Cliente HTTP/WS]
      ↓
[Endpoint (Plug)]
      ↓
[Router] → [Plug Pipeline] (auth, logging, CORS)
      ↓
[Controller / LiveView]
      ↓
[Context] (lógica de negócio por domínio)
      ↓
[Ecto Schema + Changeset] (validação e estrutura de dados)
      ↓
[Repo] (acesso ao banco via Ecto)
      ↓
[PostgreSQL]
```

| Camada           | Elixir/Phoenix                              | Responsabilidade                                      |
|------------------|---------------------------------------------|-------------------------------------------------------|
| Router           | `vendaqui_web/router.ex`                   | Definição de rotas e pipelines                        |
| Plug Pipeline    | Plugs no router e endpoint                  | Autenticação, CORS, logging, parsing                  |
| Controller       | `vendaqui_web/controllers/`                | Receber conn, chamar contexts, retornar response      |
| LiveView         | `vendaqui_web/live/`                        | UI reativa em tempo real via WebSocket                |
| Context          | `vendaqui/` (ex: `Vendaqui.Catalog`)       | Lógica de negócio agrupada por domínio                |
| Schema/Changeset | `vendaqui/` schemas com Ecto               | Estrutura de dados e validação de entrada             |
| Repo             | `vendaqui/repo.ex`                          | Acesso ao banco de dados via Ecto                     |

### Princípios

- **Separation of Concerns**: cada camada tem uma responsabilidade única.
- **Contexts**: a lógica de negócio é agrupada em módulos de contexto (ex: `Vendaqui.Catalog`, `Vendaqui.Orders`), não em services genéricos.
- **Fail Fast**: validações via Ecto Changesets o mais cedo possível na pipeline.
- **Convention over Configuration**: seguir convenções do Phoenix e do Elixir (ex: `mix phx.gen.context`).
- **Let It Crash**: confiar nos supervisors OTP para reinicialização automática em caso de falha.

## 🗄️ Banco de Dados

### Convenções de Nomenclatura

- Tabelas: `snake_case`, plural (ex: `products`, `order_items`)
- Colunas: `snake_case` (ex: `created_at`, `unit_price`)
- Índices: `idx_{tabela}_{coluna}` (ex: `idx_products_category`)
- Foreign Keys: `fk_{tabela_origem}_{tabela_destino}`

## 🔌 API

### Padrão de Endpoints

```
GET    /api/v1/{resource}          # Listar
GET    /api/v1/{resource}/:id      # Buscar por ID
POST   /api/v1/{resource}          # Criar
PUT    /api/v1/{resource}/:id      # Atualizar (completo)
PATCH  /api/v1/{resource}/:id      # Atualizar (parcial)
DELETE /api/v1/{resource}/:id      # Remover
```

### Formato de Resposta

```json
{
  "success": true,
  "data": {},
  "message": "Operação realizada com sucesso",
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 150
  }
}
```

### Formato de Erro

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Dados inválidos",
    "details": [
      {
        "field": "email",
        "message": "Formato de e-mail inválido"
      }
    ]
  }
}
```

## 🔐 Segurança

- Autenticação via JWT (access token + refresh token)
- Rate limiting por IP e por usuário
- Helmet.js para headers de segurança
- CORS configurado para origens permitidas
- Validação de entrada em todas as rotas
- Sanitização de output

## 🛠️ Stack Tecnológica

| Camada              | Tecnologia                              |
|---------------------|-----------------------------------------|
| Linguagem           | Elixir 1.20+                            |
| Runtime             | Erlang/OTP 29+                          |
| Framework Web       | Phoenix 1.8+                            |
| UI Reativa          | Phoenix LiveView                        |
| Banco de Dados      | PostgreSQL (via Ecto)                   |
| ORM/Query Layer     | Ecto                                    |
| Validação           | Ecto Changesets                         |
| Autenticação        | mix phx.gen.auth                        |
| Testes              | ExUnit                                  |
| Assets              | ESBuild + Tailwind CSS                  |
| Deploy              | Releases OTP (mix release)              |

> Veja o detalhamento e justificativas em [ADR-001](adr/0001-linguagem-e-framework.md).

## 📝 ADRs (Architecture Decision Records)

Decisões arquiteturais significativas são documentadas como ADRs em `docs/adr/`.

### Índice de ADRs

| Número | Título | Status | Data |
|--------|--------|--------|------|
| [ADR-001](adr/0001-linguagem-e-framework.md) | Linguagem e Framework Principal (Elixir/Phoenix) | Aceita | 2026-09-28 |

### Template de ADR

```markdown
# ADR-XXX: Título da Decisão

## Status
[Proposta | Aceita | Deprecada | Substituída]

## Contexto
[Qual problema estamos resolvendo?]

## Decisão
[O que decidimos fazer?]

## Consequências
[Quais são os impactos positivos e negativos?]

## Alternativas Consideradas
[O que mais foi avaliado?]
```

---

> **Para contribuidores usando IA:** Sempre inclua este arquivo como contexto ao pedir para a IA gerar código para o projeto. Isso garante que o código gerado siga nossos padrões.
