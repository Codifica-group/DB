CREATE DATABASE eleve;
USE eleve;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(256) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    num_celular CHAR(11) NOT NULL,
    cep CHAR(8) NOT NULL,
    num_endereco VARCHAR(10),
    complemento VARCHAR(100)
);

CREATE TABLE pacote (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(9) NOT NULL
);

CREATE TABLE cliente_pacote (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    pacote_id INT NOT NULL,
    data_inicio DATE,
    data_expiracao DATE,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (pacote_id) REFERENCES pacote(id)
);

CREATE TABLE raca (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE pet (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    raca_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (raca_id) REFERENCES raca(id)
);

CREATE TABLE servico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor_base FLOAT NOT NULL
);

CREATE TABLE agenda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pet_id INT NOT NULL,
    data_hora_inicio DATETIME NOT NULL,
    data_hora_fim DATETIME NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES pet(id)
);

CREATE TABLE agenda_servico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    agenda_id INT NOT NULL,
    servico_id INT NOT NULL,
    valor FLOAT NOT NULL,
    FOREIGN KEY (agenda_id) REFERENCES agenda(id),
    FOREIGN KEY (servico_id) REFERENCES servico(id)
);

CREATE TABLE categoria_despesa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria_despesa_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (categoria_despesa_id) REFERENCES categoria_despesa(id)
);

CREATE TABLE despesa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    produto_id INT NOT NULL,
    valor FLOAT NOT NULL,
    data DATETIME NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- Usuário admin
INSERT INTO usuario (nome, email, senha)
VALUES ('Admin', 'admin@email.com', 'Admin');

-- Pacotes
INSERT INTO pacote (tipo)
VALUES ('Quinzenal'), ('Mensal');

-- Raças
INSERT INTO raca (nome)
VALUES ('Poodle'), ('Golden Retriever'), ('Shih Tzu'), ('Bulldog'), ('Labrador');

-- Categorias de despesas
INSERT INTO categoria_despesa (nome)
VALUES ('Gasto fixo'), ('Manutenção'), ('Insumo'), ('Produto');

-- Serviços
INSERT INTO servico (nome, valor_base)
VALUES 
    ('Banho', 40.00),
    ('Tosa', 50.00),
    ('Hidratação', 70.00);

-- Seleciona todos os pets com seus respectivos donos e raças
SELECT 
    pet.nome AS nome_pet,
    cliente.nome AS nome_cliente,
    raca.nome AS raca
FROM pet
JOIN cliente ON pet.cliente_id = cliente.id
JOIN raca ON pet.raca_id = raca.id;

-- Exibe todos os agendamentos com nome do pet, dono e horários
SELECT 
    agenda.id AS id_agenda,
    cliente.nome AS cliente,
    pet.nome AS pet,
    agenda.data_hora_inicio,
    agenda.data_hora_fim
FROM agenda
JOIN pet ON agenda.pet_id = pet.id
JOIN cliente ON pet.cliente_id = cliente.id;

-- Mostra todos os serviços realizados em agendamentos, com valores cobrados
SELECT 
    agenda.id AS id_agenda,
    cliente.nome AS cliente,
    pet.nome AS pet,
    servico.nome AS servico,
    agenda_servico.valor AS valor_final,
    agenda.data_hora_inicio
FROM agenda_servico
JOIN agenda ON agenda_servico.agenda_id = agenda.id
JOIN pet ON agenda.pet_id = pet.id
JOIN cliente ON pet.cliente_id = cliente.id
JOIN servico ON agenda_servico.servico_id = servico.id;

-- Lista todas as despesas, produtos relacionados e categorias
SELECT 
    despesa.id AS id_despesa,
    produto.nome AS produto,
    categoria_despesa.nome AS categoria,
    despesa.valor,
    despesa.data
FROM despesa
JOIN produto ON despesa.produto_id = produto.id
JOIN categoria_despesa ON produto.categoria_despesa_id = categoria_despesa.id;

-- Mostra quais clientes têm pacotes e quando eles expiram
SELECT 
    cliente.nome AS cliente,
    pacote.tipo AS tipo_pacote,
    cliente_pacote.data_expiracao
FROM cliente_pacote
JOIN cliente ON cliente_pacote.cliente_id = cliente.id
JOIN pacote ON cliente_pacote.pacote_id = pacote.id;

-- Lista todos os serviços disponíveis no sistema e seus valores base
SELECT 
    nome AS servico,
    valor_base
FROM servico;

-- Lista todos os produtos e suas categorias
SELECT 
    produto.nome AS produto,
    categoria_despesa.nome AS categoria
FROM produto
JOIN categoria_despesa ON produto.categoria_despesa_id = categoria_despesa.id;

-- Mostra os pets e a raça associada a cada um
SELECT 
    produto.nome AS produto,
    categoria_despesa.nome AS categoria
FROM produto
JOIN categoria_despesa ON produto.categoria_despesa_id = categoria_despesa.id;

-- DROP DATABASE eleve; --