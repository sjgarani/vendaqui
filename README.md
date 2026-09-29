# VendAqui

> Plataforma de vendas inteligente.

## 📋 Visão Geral

VendAqui é um projeto voltado para facilitar vendas de forma prática e eficiente, construído com **Elixir** e **Phoenix Framework**.

## 🚀 Início Rápido

```bash
# Clone o repositório
git clone <url-do-repositorio>

# Entre na pasta do projeto
cd vendaqui

# Instale as dependências
mix deps.get

# Configure o banco de dados
mix ecto.setup

# Inicie o servidor Phoenix
mix phx.server
```

Acesse [`localhost:4000`](http://localhost:4000) no navegador.

## 📁 Estrutura do Projeto

```
vendaqui/
├── README.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── LICENSE
├── CHANGELOG.md
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── PULL_REQUEST_TEMPLATE.md
├── docs/
│   ├── ARCHITECTURE.md
│   ├── AI_GUIDELINES.md
│   ├── PROMPT_ENGINEERING.md
│   ├── AI_CODE_REVIEW.md
│   └── adr/                    # Architecture Decision Records
│       └── 0001-linguagem-e-framework.md
└── src/                        # Código-fonte Phoenix (gerado via mix phx.new)
```

## 🛠️ Tecnologias

| Camada          | Tecnologia              |
|-----------------|-------------------------|
| Linguagem       | Elixir 1.20+            |
| Runtime         | Erlang/OTP 29+          |
| Framework Web   | Phoenix 1.8+            |
| UI Reativa      | Phoenix LiveView        |
| Banco de Dados  | PostgreSQL               |
| ORM             | Ecto                    |
| Testes          | ExUnit                  |
| Assets          | ESBuild + Tailwind CSS  |

## 🤖 Uso de IA no Projeto

Este projeto segue as melhores práticas para uso de Inteligência Artificial no desenvolvimento de software. Consulte os guias na pasta `docs/` para mais detalhes:

- [Diretrizes de IA](docs/AI_GUIDELINES.md) — Regras e princípios para uso de IA
- [Engenharia de Prompts](docs/PROMPT_ENGINEERING.md) — Como escrever prompts eficazes
- [Revisão de Código com IA](docs/AI_CODE_REVIEW.md) — Checklist para revisar código gerado por IA
- [Arquitetura](docs/ARCHITECTURE.md) — Decisões arquiteturais do projeto
- [ADR-001 – Elixir/Phoenix](docs/adr/0001-linguagem-e-framework.md) — Decisão de linguagem e framework

## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## 🤝 Contribuindo

Leia o [Guia de Contribuição](CONTRIBUTING.md) antes de enviar sua contribuição.

