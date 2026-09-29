# ADR-002: Gestão de Secrets e Variáveis de Ambiente

## Status

Aceita

## Contexto

O alerta do GitGuardian no PR #1 ([commit 67c5cbd](https://github.com/sjgarani/vendaqui/commit/67c5cbd4f340fc7b497c33f6a8c307805e686574)) identificou duas chaves sensíveis commitadas no repositório:

- `secret_key_base` em `src/config/dev.exs`
- `secret_key_base` em `src/config/test.exs`

Chaves expostas em repositórios — mesmo que privados — representam risco de segurança crítico:
- Rotação de credenciais não é suficiente se o histórico do Git for acessível
- Tokens e chaves comprometidas podem ser usados para acessar dados de produção
- O padrão gerado pelo `mix phx.new` inclui valores placeholder que **não devem ser commitados**

## Decisão

**Nunca hardcodar segredos, senhas ou chaves no código-fonte.** Todas as informações sensíveis devem ser gerenciadas como variáveis de ambiente, seguindo o padrão [12-Factor App – Config](https://12factor.net/config).

### Regras obrigatórias

1. **Secrets NUNCA vão para o repositório** — nem em branches de desenvolvimento, nem em arquivos de configuração de ambiente.
2. **Use variáveis de ambiente** — lidas via `System.get_env/1` ou `System.fetch_env!/1` nos arquivos de config do Elixir.
3. **`.env` está no `.gitignore`** — o arquivo com valores reais jamais é versionado.
4. **`.env.example` é o contrato** — documenta todas as variáveis necessárias sem valores reais; é versionado e serve de template.
5. **Rotação imediata** — qualquer chave acidentalmente exposta deve ser revogada/rotacionada imediatamente, independente de o repositório ser privado.

### Padrão de uso em Elixir/Phoenix

```elixir
# ✅ Correto — lê da variável de ambiente, falha explicitamente se ausente
secret_key_base: System.fetch_env!("SECRET_KEY_BASE")

# ✅ Correto — lê com fallback para desenvolvimento local
username: System.get_env("DB_USERNAME", "postgres")

# ❌ Proibido — valor hardcoded
secret_key_base: "NAuw7g49cvvCiit/TZYJr2fRHU..."
password: "minhasenha123"
```

### Onde configurar os valores reais

| Ambiente    | Como configurar                                             |
|-------------|-------------------------------------------------------------|
| Local (dev) | Arquivo `.env` (ignorado pelo git) carregado com `source .env` ou ferramenta como `dotenv-cli` |
| CI (GitHub Actions) | `Settings → Secrets and variables → Actions`       |
| Produção    | Secrets do provedor (Fly.io: `fly secrets set`, Heroku: `heroku config:set`, etc.) |

### Geração de chaves seguras

```bash
# Gerar SECRET_KEY_BASE
mix phx.gen.secret

# Gerar senha de banco aleatória (exemplo)
openssl rand -base64 32
```

## Consequências

### Positivas
- Elimina riscos de exposição de credenciais no histórico do Git.
- Facilita rotação de secrets sem necessidade de alterar código.
- Cada ambiente (dev, test, prod) usa seus próprios valores isolados.
- Alinhamento com boas práticas de segurança (12-Factor App, OWASP).

### Negativas / Atenções
- Desenvolvedores precisam configurar o `.env` local antes de rodar o projeto.
- O `.env.example` deve ser mantido atualizado sempre que uma nova variável for adicionada.
- Em CI, cada nova variável de ambiente exige cadastro manual como secret.

## Ações tomadas (PR #1 → correção)

- Removidas as chaves `secret_key_base` hardcoded de `dev.exs` e `test.exs`
- Removidas credenciais de banco hardcoded dos arquivos de config
- Adicionado `.env`, `.env.local`, `.env.*.local` e `*.secret.exs` ao `.gitignore`
- Criado `src/.env.example` como template documentado de todas as variáveis necessárias
- **As chaves expostas foram invalidadas** — gere novas com `mix phx.gen.secret`

## Referências

- [12-Factor App – Config](https://12factor.net/config)
- [OWASP – Secrets Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
- [Phoenix – Configuration](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Secret.html)
- [GitGuardian – Remediation](https://docs.gitguardian.com/secrets-detection/remediation)
