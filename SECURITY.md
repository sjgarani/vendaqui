# Política de Segurança

## Versões Suportadas

| Versão | Suportada          |
|--------|--------------------|
| 1.x    | ✅ Sim             |
| < 1.0  | ❌ Não             |

## Reportando Vulnerabilidades

Se você descobrir uma vulnerabilidade de segurança, **NÃO** abra uma issue pública.

### Como reportar

1. Envie um e-mail para: **security@vendaqui.com** (substituir pelo e-mail real)
2. Inclua o máximo de detalhes possível:
   - Descrição da vulnerabilidade
   - Passos para reproduzir
   - Impacto potencial
   - Sugestão de correção (se tiver)

### Tempo de Resposta

- **Confirmação de recebimento**: até 48 horas
- **Avaliação inicial**: até 7 dias
- **Correção**: depende da severidade

## 🤖 Segurança no Uso de IA

### Dados Sensíveis

- **NUNCA** insira credenciais, tokens, chaves de API ou senhas em prompts de IA.
- **NUNCA** compartilhe dados pessoais de usuários com ferramentas de IA.
- **NUNCA** envie código proprietário confidencial para modelos de IA públicos.

### Código Gerado por IA

- **Sempre** revise código gerado por IA quanto a vulnerabilidades de segurança.
- Verifique especialmente:
  - Injeção de SQL
  - Cross-Site Scripting (XSS)
  - Exposição de dados sensíveis
  - Dependências inseguras ou desatualizadas
  - Hardcoded secrets
  - Falta de validação de entrada

### Dependências

- Verifique a procedência de qualquer dependência sugerida por IA.
- Use ferramentas de auditoria (ex: `npm audit`, `pip audit`) regularmente.
- Não confie cegamente em pacotes sugeridos — podem ser inexistentes ou maliciosos (ataque de alucinação de pacotes).

## Boas Práticas

- Use variáveis de ambiente para segredos (`.env` + `.gitignore`).
- Implemente autenticação e autorização adequadas.
- Mantenha dependências atualizadas.
- Use HTTPS em todas as comunicações.
- Implemente rate limiting em APIs.
- Faça logging de segurança sem expor dados sensíveis.
