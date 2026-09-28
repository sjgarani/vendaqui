# Engenharia de Prompts — Guia Prático

## 📋 Visão Geral

Este guia apresenta técnicas para escrever prompts eficazes ao utilizar IA no desenvolvimento do **VendAqui**. Prompts bem escritos geram resultados significativamente melhores.

## 🎯 Princípios Fundamentais

### 1. Seja Específico

❌ **Ruim:**
```
Crie uma API de vendas.
```

✅ **Bom:**
```
Crie um endpoint REST em Node.js com Express para listar produtos à venda.
- Rota: GET /api/v1/products
- Suporte a paginação (page, limit)
- Filtros: categoria, preço mínimo, preço máximo
- Retorne JSON com: id, nome, preço, categoria, estoque
- Inclua tratamento de erros com status codes apropriados
```

### 2. Forneça Contexto

❌ **Ruim:**
```
Corrija esse bug.
```

✅ **Bom:**
```
No nosso projeto VendAqui (Node.js + Express + PostgreSQL), a rota 
GET /api/v1/orders está retornando erro 500 quando o usuário não tem 
pedidos. O erro é: "Cannot read properties of null (reading 'map')".

Código atual:
[cole o código aqui]

O comportamento esperado é retornar um array vazio [] com status 200.
```

### 3. Defina o Formato de Saída

```
Gere um componente React para card de produto com as seguintes specs:
- Use TypeScript
- Use Tailwind CSS para estilização
- Props: { id: string, name: string, price: number, image: string }
- Inclua botão "Adicionar ao Carrinho"
- O componente deve ser responsivo
- Exporte como default
```

### 4. Use Exemplos (Few-Shot)

```
Crie validações para o formulário de cadastro seguindo este padrão:

Exemplo de entrada:
  { email: "invalido", senha: "123" }

Exemplo de saída:
  {
    valid: false,
    errors: {
      email: "Formato de e-mail inválido",
      senha: "A senha deve ter no mínimo 8 caracteres"
    }
  }

Agora crie validações para os campos: nome, CPF, telefone, endereço.
```

## 🧩 Técnicas Avançadas

### Chain of Thought (Cadeia de Pensamento)

Peça à IA para pensar passo a passo:

```
Analise este código de processamento de pagamentos e identifique 
problemas de segurança. Pense passo a passo:

1. Primeiro, analise o fluxo de dados
2. Identifique onde dados sensíveis são manipulados
3. Verifique se há validação de input
4. Cheque se há proteção contra ataques comuns
5. Liste cada problema encontrado com severidade e sugestão de correção

[código aqui]
```

### Role Prompting (Definição de Papel)

```
Você é um engenheiro de software sênior especializado em segurança 
de aplicações web e-commerce. Revise o seguinte código de checkout 
e aponte vulnerabilidades:

[código aqui]
```

### Iteração e Refinamento

```
Prompt 1: "Crie a estrutura base do modelo de Produto"
Prompt 2: "Adicione validações ao modelo criado"
Prompt 3: "Agora adicione índices de banco de dados para otimizar buscas por categoria e preço"
Prompt 4: "Crie os testes unitários para as validações"
```

### Constraining (Definição de Restrições)

```
Crie uma função de busca de produtos com estas RESTRIÇÕES:
- Máximo de 30 linhas
- Sem dependências externas
- Complexidade O(n log n) ou melhor
- Compatível com Node.js 18+
- Sem usar eval() ou Function()
```

## 📝 Templates de Prompts

### Para Criar Features

```
## Contexto
Projeto: VendAqui (e-commerce)
Stack: [sua stack]
Módulo: [módulo afetado]

## Requisito
[descrição da feature]

## Critérios de Aceitação
- [ ] [critério 1]
- [ ] [critério 2]

## Restrições
- [restrição 1]
- [restrição 2]

## Saída Esperada
- Código com tipagem (se aplicável)
- Testes unitários
- Documentação inline
```

### Para Debugging

```
## Erro
[mensagem de erro completa]

## Contexto
- Arquivo: [caminho do arquivo]
- Função: [nome da função]
- Quando ocorre: [condição para reproduzir]

## Código Relevante
[trecho de código]

## Já Tentei
- [tentativa 1]
- [tentativa 2]

## Comportamento Esperado vs Atual
- Esperado: [...]
- Atual: [...]
```

### Para Code Review

```
Revise este código considerando:
1. Legibilidade e manutenibilidade
2. Performance
3. Segurança
4. Tratamento de erros
5. Aderência a padrões do projeto
6. Sugestões de melhoria

Formato de resposta para cada item encontrado:
- 📍 Localização: [linha/função]
- 🏷️ Categoria: [segurança|performance|legibilidade|bug]
- 🔴🟡🟢 Severidade: [alta|média|baixa]
- 💡 Sugestão: [como corrigir]

[código aqui]
```

## ⚠️ Armadilhas Comuns

| Armadilha                        | Como Evitar                                          |
|----------------------------------|------------------------------------------------------|
| Prompts vagos                    | Seja específico sobre linguagem, framework, contexto |
| Confiar na primeira resposta     | Itere e refine o resultado                           |
| Não fornecer contexto            | Inclua stack, versões, código existente               |
| Pedir tudo de uma vez            | Quebre em prompts menores e incrementais              |
| Ignorar edge cases               | Peça explicitamente para lidar com casos limite       |
| Não validar o output             | Sempre teste e revise o código gerado                 |

## 🔗 Recursos Adicionais

- [OpenAI Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)
- [Anthropic Prompt Engineering Guide](https://docs.anthropic.com/claude/docs/prompt-engineering)
- [Google AI Prompt Design](https://ai.google.dev/docs/prompt_best_practices)
