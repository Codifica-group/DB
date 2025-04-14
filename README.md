# 🐾 Eleve Petshop - Banco de Dados

Este projeto define a estrutura de banco de dados relacional para um sistema de petshop chamado **Eleve**. Ele gerencia clientes, pets, serviços, agendamentos, pacotes de assinatura, despesas e muito mais.

---

## 📌 Tecnologias

- MySQL
- SQL ANSI
- DER (diagrama disponível na documentação)

---

## 🧱 Estrutura do Banco

O banco de dados **Eleve** é composto pelas seguintes tabelas principais:

| Tabela              | Descrição                                         |
|---------------------|---------------------------------------------------|
| `USUARIO`           | Usuários do sistema (ex: admin)                  |
| `CLIENTE`           | Clientes do petshop                              |
| `PACOTE`            | Pacotes de serviço (quinzenal ou mensal)         |
| `CLIENTE_PACOTE`    | Relacionamento entre cliente e pacote            |
| `RACA`              | Raças dos animais                                |
| `PET`               | Pets dos clientes                                |
| `SERVICO`           | Serviços prestados (banho, tosa, etc.)           |
| `AGENDA`            | Agendamentos dos pets                            |
| `AGENDA_SERVICO`    | Serviços incluídos em cada agendamento           |
| `CATEGORIA_DESPESAS`| Categorias para despesas                         |
| `PRODUTO`           | Produtos utilizados no petshop                   |
| `DESPESAS`          | Despesas registradas                             |

---

## 📄 Scripts Incluídos

O arquivo SQL contém:

- Criação do banco `eleve`
- Criação de todas as tabelas com chaves primárias e estrangeiras
- População inicial de tabelas como:
  - `USUARIO` com um admin
  - `PACOTE`, `RACA`, `CATEGORIA_DESPESAS`, `SERVICO`

---

## 🔍 Consultas Úteis

Estão disponíveis no script várias **queries SQL úteis**, como:

- Pets com seus donos e raças
- Agendamentos com datas e nomes dos donos e pets
- Serviços agendados com valor cobrado
- Despesas agrupadas por produto e categoria
- Clientes com pacotes ativos e data de expiração

