# Checklist de Revisão de Código Gerado por IA

## 📋 Visão Geral

Este checklist deve ser seguido **sempre** que código gerado por IA for incorporado ao projeto. A revisão humana é **obrigatória** — IA é uma ferramenta, não um substituto para julgamento profissional.

## ✅ Checklist Geral

### 🔍 Compreensão

- [ ] Eu **entendo completamente** o que cada linha do código faz
- [ ] O código resolve o problema correto (não apenas um problema similar)
- [ ] A abordagem escolhida é apropriada para nosso contexto

### 🏗️ Arquitetura e Design

- [ ] O código segue os padrões arquiteturais do projeto
- [ ] Responsabilidades estão bem separadas (Single Responsibility)
- [ ] Não há acoplamento desnecessário
- [ ] O código é extensível e manutenível
- [ ] Não duplica funcionalidade já existente no projeto

### 📝 Qualidade de Código

- [ ] Nomes de variáveis/funções são descritivos e consistentes
- [ ] Não há código morto ou comentado desnecessariamente
- [ ] Complexidade ciclomática está aceitável
- [ ] O código passa no linter sem warnings
- [ ] Formatação segue o padrão do projeto

### 🔒 Segurança

- [ ] **Inputs são validados e sanitizados**
- [ ] Não há vulnerabilidades de **injeção** (SQL, NoSQL, XSS, Command Injection)
- [ ] **Dados sensíveis** não são expostos em logs ou respostas
- [ ] Não há **credenciais hardcoded**
- [ ] **Autenticação/Autorização** estão implementadas corretamente
- [ ] Não há **dependências desconhecidas ou suspeitas**
- [ ] Proteção contra **CSRF**, **SSRF** e outros ataques comuns

### ⚡ Performance

- [ ] Não há **loops desnecessários** ou **operações N+1**
- [ ] Queries de banco estão **otimizadas** (índices, projeções)
- [ ] Não há **memory leaks** evidentes
- [ ] **Caching** é utilizado quando apropriado
- [ ] Operações pesadas são **assíncronas** quando possível

### 🧪 Testes

- [ ] Testes unitários cobrem os cenários principais
- [ ] **Edge cases** são testados (null, undefined, arrays vazios, etc.)
- [ ] **Cenários de erro** são testados
- [ ] Testes são **independentes** entre si
- [ ] Mocks/stubs são usados **apropriadamente**

### 🐛 Problemas Comuns da IA

- [ ] ~~Imports/dependências~~ que **não existem** foram removidos
- [ ] APIs/métodos usados **realmente existem** nas versões que usamos
- [ ] Código não é **verboso demais** (IA tende a over-engineering)
- [ ] **Tratamento de erros** não é genérico demais (catch-all)
- [ ] **Tipos/interfaces** estão corretos (IA pode inventar tipos)
- [ ] **Lógica de negócio** está correta (IA pode interpretar errado)
- [ ] Não há **alucinação de APIs** (métodos que parecem existir mas não existem)
- [ ] Não há **pacotes npm/pip fantasma** sugeridos que não existem

## 🔴 Red Flags — Pare e Investigue

Se encontrar qualquer item abaixo, **não aprove** o PR até resolver:

| Red Flag                                  | Risco                                     |
|-------------------------------------------|-------------------------------------------|
| Código que você não entende               | Bug oculto, vulnerabilidade               |
| Dependência desconhecida                  | Supply chain attack                       |
| Regex complexa não testada                | ReDoS, falsos positivos/negativos         |
| Manipulação de strings para SQL/HTML      | Injeção                                   |
| `eval()`, `Function()`, `exec()`          | Execução arbitrária de código             |
| `dangerouslySetInnerHTML` (React)         | XSS                                       |
| Desabilitação de verificação SSL/TLS      | Man-in-the-middle                         |
| Permissões excessivas (chmod 777, etc.)   | Escalação de privilégios                  |
| Serialização/deserialização insegura      | Remote Code Execution                     |

## 📊 Níveis de Revisão

### Nível 1 — Quick Review (código simples)
Boilerplate, formatação, utilitários simples.
- [ ] Compreensão ✓
- [ ] Lint ✓
- [ ] Testes básicos ✓

### Nível 2 — Standard Review (código moderado)
Features, integrações, lógica de negócio.
- [ ] Todos os itens do Nível 1
- [ ] Segurança ✓
- [ ] Performance ✓
- [ ] Testes completos ✓

### Nível 3 — Deep Review (código crítico)
Pagamentos, autenticação, dados sensíveis.
- [ ] Todos os itens do Nível 2
- [ ] Revisão por **2+ desenvolvedores**
- [ ] Teste de penetração (se aplicável)
- [ ] Análise estática de segurança (SAST)

## 🔄 Processo de Revisão

```
1. Ler o código gerado por IA completamente
        ↓
2. Classificar o nível de revisão necessário
        ↓
3. Executar o checklist correspondente
        ↓
4. Rodar testes automatizados
        ↓
5. Testar manualmente os cenários críticos
        ↓
6. Documentar achados e correções
        ↓
7. Aprovar ou solicitar mudanças
```

## 💡 Dicas Finais

1. **Desconfie de código que parece "bom demais"** — IA gera código fluente que pode esconder bugs sutis.
2. **Teste com dados reais** (não apenas dados de exemplo da IA).
3. **Verifique a documentação oficial** das APIs utilizadas.
4. **Compare com implementações existentes** no projeto.
5. **Peça à IA para explicar** o código se não entender algo — mas verifique a explicação.
