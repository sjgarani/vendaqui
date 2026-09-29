# ADR-001: Linguagem e Framework Principal

## Status

Aceita

## Contexto

O projeto VendAqui é uma plataforma de vendas que exige alta disponibilidade, capacidade de lidar com múltiplas conexões simultâneas (ex: atualizações em tempo real de pedidos, estoque, notificações) e escalabilidade. A escolha da linguagem e framework é uma das decisões arquiteturais mais impactantes do projeto, afetando performance, produtividade do time, ecossistema de bibliotecas e operação em produção.

Critérios avaliados:
- **Concorrência e performance**: suporte nativo a alto volume de requisições simultâneas
- **Tempo real (realtime)**: capacidade de WebSockets e atualizações ao vivo
- **Manutenibilidade**: clareza do código, padrões bem estabelecidos
- **Ecossistema**: bibliotecas maduras para autenticação, banco de dados, testes
- **Produtividade**: velocidade de desenvolvimento e convenções sólidas

## Decisão

Adotar **Elixir** como linguagem principal e **Phoenix Framework** como framework web.

### Justificativas

- **Elixir/OTP**: baseado na VM Erlang (BEAM), oferece concorrência massiva via processos leves (actors), tolerância a falhas nativa e distribuição, características críticas para uma plataforma de vendas com múltiplos usuários simultâneos.
- **Phoenix LiveView**: permite criar interfaces reativas em tempo real (atualizações de pedidos, estoque, notificações) sem necessidade de uma SPA separada, reduzindo a complexidade arquitetural.
- **Phoenix Framework**: framework produtivo com geradores de código, convenções MVC sólidas, suporte nativo a WebSockets via Channels e PubSub, e pipeline de plugs flexível.
- **Ecto**: biblioteca de banco de dados e queries que oferece changesets para validação de dados, migrations versionadas e suporte a múltiplos adaptadores (PostgreSQL primário).
- **Alta disponibilidade**: supervisor trees do OTP permitem reinicialização automática de processos falhos sem derrubar a aplicação.

### Stack definida

| Camada              | Tecnologia                              |
|---------------------|-----------------------------------------|
| Linguagem           | Elixir 1.20+                            |
| Runtime             | Erlang/OTP 29+                          |
| Framework Web       | Phoenix 1.8+                            |
| UI Reativa          | Phoenix LiveView                        |
| Banco de Dados      | PostgreSQL (via Ecto)                   |
| ORM/Query Layer     | Ecto                                    |
| Validação           | Ecto Changesets                         |
| Autenticação        | mix phx.gen.auth (baseado em Guardian)  |
| Testes              | ExUnit (nativo do Elixir)               |
| Assets              | ESBuild + Tailwind CSS                  |
| Deploy              | Releases OTP (mix release)              |

## Consequências

### Positivas
- Suporte nativo a milhares de conexões simultâneas com baixo consumo de memória.
- Tolerância a falhas via supervisors OTP: a plataforma continua operando mesmo com falhas parciais.
- Phoenix LiveView elimina a necessidade de um frontend JavaScript separado para funcionalidades reativas.
- Código altamente testável e funcional, com ExUnit integrado.
- Hot code reloading em desenvolvimento.

### Negativas / Riscos
- Curva de aprendizado mais íngreme para desenvolvedores vindos de linguagens imperativas (ex: JavaScript, Python, Ruby).
- Ecossistema menor em comparação a Node.js ou Java/Spring para casos de uso de nicho.
- Menor oferta de profissionais no mercado de trabalho em comparação a Python ou JavaScript.
- Ferramentas de observabilidade (APM) menos maduras do que para runtimes JVM ou Node.

### Mitigações
- Investir em onboarding e documentação interna de padrões Elixir/Phoenix.
- Documentar decisões e convenções no `docs/ARCHITECTURE.md` e em ADRs para facilitar entrada de novos membros.

## Alternativas Consideradas

| Alternativa        | Motivo da Rejeição                                                     |
|--------------------|------------------------------------------------------------------------|
| Node.js + NestJS   | Concorrência baseada em event loop único, sem isolamento de falhas nativo |
| Ruby on Rails      | Performance e concorrência inferiores para workloads com tempo real    |
| Python + FastAPI   | Bom para APIs, mas sem equivalente ao LiveView; ecossistema de real time mais complexo |
| Java + Spring Boot | Verboso, startup lento; overhead de JVM para escala horizontal pequena |
| Go + Gin           | Boa performance, mas sem o modelo de tolerância a falhas OTP           |

## Referências

- [Elixir Official Docs](https://elixir-lang.org/)
- [Phoenix Framework](https://www.phoenixframework.org/)
- [Phoenix LiveView](https://github.com/phoenixframework/phoenix_live_view)
- [Ecto](https://hexdocs.pm/ecto/Ecto.html)
- [Why Elixir?](https://elixir-lang.org/blog/2020/10/27/read-more-about-elixir-at-stack-overflow/)
