# Diretrizes de Uso de IA no Projeto

## 📋 Visão Geral

Este documento estabelece as diretrizes para uso responsável e eficaz de Inteligência Artificial no desenvolvimento do **VendAqui**. O objetivo é maximizar a produtividade mantendo a qualidade, segurança e ética.

## ✅ Usos Permitidos

### Geração de Código
- Scaffolding e boilerplate
- Implementação de funções utilitárias
- Conversão entre formatos de dados
- Geração de testes unitários
- Refatoração de código existente

### Documentação
- Geração de docstrings e comentários
- Criação de documentação técnica
- Tradução de documentação
- Geração de exemplos de uso

### Debugging
- Análise de erros e stack traces
- Sugestão de correções
- Identificação de code smells

### DevOps
- Criação de scripts de automação
- Configuração de CI/CD
- Dockerfiles e configs de infra

## ⚠️ Usos com Cautela

| Uso                              | Cuidado Necessário                                     |
|----------------------------------|--------------------------------------------------------|
| Lógica de negócios complexa      | Revisar minuciosamente, testar extensivamente          |
| Queries de banco de dados         | Verificar performance e segurança (SQL injection)      |
| Código de autenticação/segurança  | Revisão obrigatória por humano com expertise            |
| Arquitetura de sistemas           | IA como sugestão, decisão final é humana               |
| Estimativas de esforço            | IA tende a subestimar complexidade                     |

## 🚫 Usos Proibidos

- **NUNCA** envie credenciais, tokens ou chaves de API para ferramentas de IA
- **NUNCA** envie dados pessoais de clientes para modelos de IA
- **NUNCA** use IA para gerar código malicioso
- **NUNCA** copie código de fontes protegidas via IA sem verificar licenciamento
- **NUNCA** confie cegamente em código gerado por IA sem revisão

## 🔄 Fluxo de Trabalho com IA

```
1. Definir o problema claramente
        ↓
2. Escrever prompt específico e contextualizado
        ↓
3. Gerar código/solução com IA
        ↓
4. Revisar criticamente o output
        ↓
5. Testar manualmente e com testes automatizados
        ↓
6. Refatorar se necessário
        ↓
7. Documentar o uso de IA no commit/PR
        ↓
8. Submeter para code review humano
```

## 📊 Métricas de Qualidade

Código gerado por IA deve atender aos mesmos padrões de qualidade de código escrito manualmente:

- **Cobertura de testes**: mínimo de 80%
- **Lint**: zero erros
- **Performance**: sem regressões
- **Segurança**: sem vulnerabilidades conhecidas
- **Legibilidade**: código claro e bem documentado

## 🏷️ Convenção de Commits

As mensagens de commit devem ser escritas em **inglês** seguindo **Conventional Commits**. Quando usar IA, adicione o sufixo `[ai-assisted]`:

```
feat(auth): implement login with OAuth2 [ai-assisted]
fix(api): fix input validation [ai-assisted]
```

## 📚 Ferramentas Recomendadas

| Ferramenta       | Uso Recomendado                    |
|------------------|------------------------------------|
| GitHub Copilot   | Autocompletar código no editor     |
| ChatGPT / Claude | Consultas, debugging, explicações  |
| Gemini           | Análise de código, refatoração     |
| Cursor           | Editor com IA integrada            |
| Codeium          | Alternativa gratuita ao Copilot    |

## 🎓 Aprendizado

- Use IA como ferramenta de aprendizado, não como substituto.
- Entenda o código gerado antes de usá-lo.
- Documente padrões aprendidos para a equipe.
