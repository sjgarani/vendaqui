# Guia de Contribuição

Obrigado por considerar contribuir com o **VendAqui**! 🎉

## 📋 Como Contribuir

### 1. Fork e Clone

1. Faça um **fork** do repositório.
2. Clone o fork para sua máquina local:

```bash
git clone <url-do-seu-fork>
cd vendaqui
```

### 2. Crie uma Branch

Crie uma branch descritiva para sua contribuição:

```bash
git checkout -b feat/minha-nova-feature
# ou
git checkout -b fix/correcao-do-bug
```

### 3. Faça suas Alterações

- Siga os padrões de código do projeto.
- Escreva testes quando aplicável.
- Se usou IA para gerar código, **revise cuidadosamente** seguindo o [Checklist de Revisão de Código com IA](docs/AI_CODE_REVIEW.md).

### 4. Commit

Siga o padrão de **Conventional Commits** com mensagens obrigatoriamente em **inglês**:

```
type(scope): short description in English

Optional body with more details in English.
```

**Tipos comuns:**

| Tipo       | Descrição                          |
|------------|------------------------------------|
| `feat`     | Nova funcionalidade                |
| `fix`      | Correção de bug                    |
| `docs`     | Alteração em documentação          |
| `style`    | Formatação (sem alteração lógica)  |
| `refactor` | Refatoração de código              |
| `test`     | Adição ou correção de testes       |
| `chore`    | Tarefas de manutenção              |

### 5. Push e Pull Request

```bash
git push origin feat/minha-nova-feature
```

Abra um **Pull Request** no repositório original usando o [template de PR](.github/PULL_REQUEST_TEMPLATE.md).

## 🤖 Uso de IA nas Contribuições

- **É permitido** usar IA como assistente para gerar código, testes e documentação.
- **É obrigatório** revisar todo código gerado por IA antes do commit.
- **Declare** no PR se usou assistência de IA (transparência).
- Siga as [Diretrizes de IA](docs/AI_GUIDELINES.md) do projeto.

## 🐛 Reportando Bugs

Use o [template de Bug Report](.github/ISSUE_TEMPLATE/bug_report.md) para reportar problemas.

## 💡 Sugerindo Features

Use o [template de Feature Request](.github/ISSUE_TEMPLATE/feature_request.md) para propor novas funcionalidades.

## 📏 Padrões de Código

- Use nomes de variáveis e funções descritivos.
- Comente código complexo.
- Mantenha funções pequenas e com responsabilidade única.
- Escreva testes para novas funcionalidades.
