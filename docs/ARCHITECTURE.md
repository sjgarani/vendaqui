# Arquitetura do Projeto

## 📋 Visão Geral

Este documento descreve as decisões arquiteturais do **VendAqui** e serve como referência para desenvolvedores e ferramentas de IA.

> **Nota sobre IA:** Ao usar IA para gerar código, forneça este documento como contexto para que a IA respeite as decisões arquiteturais do projeto.

## 🏗️ Estrutura de Diretórios

```
vendaqui/
├── .github/              # Templates e CI/CD
├── docs/                 # Documentação do projeto
├── src/                  # Código-fonte
│   ├── config/           # Configurações da aplicação
│   ├── controllers/      # Controladores (lógica de rota)
│   ├── middlewares/       # Middlewares customizados
│   ├── models/           # Modelos de dados
│   ├── routes/           # Definição de rotas
│   ├── services/         # Lógica de negócio
│   ├── utils/            # Funções utilitárias
│   └── validators/       # Schemas de validação
├── tests/                # Testes
│   ├── unit/             # Testes unitários
│   ├── integration/      # Testes de integração
│   └── e2e/              # Testes end-to-end
├── scripts/              # Scripts de automação
└── infra/                # Configs de infraestrutura
```

## 📐 Padrões Arquiteturais

### Camadas da Aplicação

```
[Cliente] → [Rotas] → [Middlewares] → [Controllers] → [Services] → [Models] → [Banco de Dados]
```

| Camada        | Responsabilidade                              |
|---------------|-----------------------------------------------|
| Routes        | Definição de endpoints                        |
| Middlewares   | Autenticação, validação, logging              |
| Controllers   | Receber request, chamar services, retornar response |
| Services      | Lógica de negócio                              |
| Models        | Definição de esquemas e acesso a dados        |
| Validators    | Schemas de validação de entrada               |
| Utils         | Funções auxiliares reutilizáveis              |

### Princípios

- **Separation of Concerns**: cada camada tem uma responsabilidade única.
- **Dependency Injection**: serviços são injetados, não instanciados diretamente.
- **Fail Fast**: validar inputs o mais cedo possível.
- **Convention over Configuration**: seguir convenções consistentes.

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

## 📝 ADRs (Architecture Decision Records)

Decisões arquiteturais significativas devem ser documentadas como ADRs nesta pasta.

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
