# 🐾 Eleve Petshop - Banco de Dados

Este projeto define a estrutura de banco de dados relacional para um sistema de petshop chamado **Eleve** e um banco de dados para o chatbot de atendimento. O sistema principal gerencia clientes, pets, serviços, agendamentos, pacotes de assinatura, despesas e muito mais.

---

## 📌 Tecnologias

- MySQL
- SQL ANSI
- DER (diagrama disponível na documentação)

---

## 🧱 Estrutura dos Bancos

### Banco de Dados `eleve`

O banco de dados **Eleve** é composto pelas seguintes tabelas principais:

| Tabela | Descrição |
|---|---|
| `usuario` | Usuários do sistema (ex: admin) |
| `cliente` | Clientes do petshop |
| `pacote` | Pacotes de serviço (quinzenal ou mensal) |
| `cliente_pacote` | Relacionamento entre cliente e pacote |
| `porte` | Porte dos animais (Pequeno, Médio, Grande) |
| `raca` | Raças dos animais |
| `pet` | Pets dos clientes |
| `servico` | Serviços prestados (banho, tosa, etc.) |
| `agenda` | Agendamentos confirmados dos pets |
| `agenda_servico` | Serviços incluídos em cada agendamento |
| `solicitacao_agenda` | Solicitações de agendamento pendentes |
| `solicitacao_agenda_servico`| Serviços incluídos em cada solicitação de agendamento |
| `categoria_produto` | Categorias para despesas |
| `produto` | Produtos utilizados no petshop |
| `despesa` | Despesas registradas |

### Banco de Dados `chatbot`

O banco de dados **Chatbot** gerencia as interações do chatbot:

| Tabela | Descrição |
|---|---|
| `chat` | Armazena o estado atual e o contexto de cada conversa |
| `cliente` | Identificador do cliente |

---

## 📄 Scripts Incluídos

Os arquivos SQL contêm:

- **script.sql**:
    - Criação do banco `eleve`.
    - Criação de todas as tabelas com chaves primárias e estrangeiras.
    - População inicial de tabelas como: `usuario` (com um admin), `pacote`, `porte`, `raca`, `categoria_produto`, `produto` e `servico`.
- **script_chatbot.sql**:
    - Criação do banco `chatbot`.
    - Criação das tabelas `chat` e `cliente`.

---

## 🔍 Consultas Úteis

Estão disponíveis nos scripts várias **queries SQL úteis**, como:

- Pets com seus donos e raças
- Agendamentos com datas e nomes dos donos e pets
- Solicitações de agendamento com seu respectivo status
- Despesas agrupadas por produto e categoria
- Clientes com pacotes ativos e data de expiração
- Produtos classificados por suas categorias
- Estado do chat e seu respectivo cliente
