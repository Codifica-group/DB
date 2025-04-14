CREATE DATABASE eleve;
USE eleve;

CREATE TABLE USUARIO (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(256) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    num_celular CHAR(11) NOT NULL,
    cep CHAR(8) NOT NULL,
    num_endereco VARCHAR(10),
    complemento VARCHAR(100)
);

CREATE TABLE PACOTE (
    id_pacote INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(9) NOT NULL
);

CREATE TABLE CLIENTE_PACOTE (
    id_cliente_pacote INT PRIMARY KEY AUTO_INCREMENT,
    fk_cliente INT,
    fk_pacote INT,
    data_expiracao DATETIME,
    FOREIGN KEY (fk_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (fk_pacote) REFERENCES PACOTE(id_pacote)
);

CREATE TABLE RACA (
    id_raca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE PET (
    id_pet INT PRIMARY KEY AUTO_INCREMENT,
    fk_cliente INT,
    fk_raca INT,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (fk_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (fk_raca) REFERENCES RACA(id_raca)
);

CREATE TABLE SERVICO (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor_base FLOAT NOT NULL
);

CREATE TABLE AGENDA (
    id_agenda INT PRIMARY KEY AUTO_INCREMENT,
    fk_pet INT,
    data_hora_inicio DATETIME NOT NULL,
    data_hora_fim DATETIME NOT NULL,
    FOREIGN KEY (fk_pet) REFERENCES PET(id_pet)
);

CREATE TABLE AGENDA_SERVICO (
    id_agenda_servico INT PRIMARY KEY AUTO_INCREMENT,
    fk_agenda INT,
    fk_servico INT,
    valor FLOAT NOT NULL,
    FOREIGN KEY (fk_agenda) REFERENCES AGENDA(id_agenda),
    FOREIGN KEY (fk_servico) REFERENCES SERVICO(id_servico)
);

CREATE TABLE CATEGORIA_DESPESAS (
    id_categoria_despesas INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE PRODUTO (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    fk_categoria_despesas INT,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (fk_categoria_despesas) REFERENCES CATEGORIA_DESPESAS(id_categoria_despesas)
);

CREATE TABLE DESPESAS (
    id_despesas INT PRIMARY KEY AUTO_INCREMENT,
    fk_produto INT,
    valor FLOAT NOT NULL,
    data DATETIME NOT NULL,
    FOREIGN KEY (fk_produto) REFERENCES PRODUTO(id_produto)
);

-- Usuário admin
INSERT INTO USUARIO (nome, email, senha)
VALUES ('######', '################', '#######');

-- Pacotes
INSERT INTO PACOTE (tipo)
VALUES ('Quinzenal'), ('Mensal');

-- Raças
INSERT INTO RACA (nome)
VALUES ('Poodle'), ('Golden Retriever'), ('Shih Tzu'), ('Bulldog'), ('Labrador');

-- Categorias de despesas
INSERT INTO CATEGORIA_DESPESAS (nome)
VALUES ('Gastos fixos'), ('Manutenção'), ('Insumos'), ('Produtos');

-- Serviços
INSERT INTO SERVICO (nome, valor_base)
VALUES 
    ('Banho', 40.00),
    ('Tosa', 50.00),
    ('Hidratação', 70.00);

-- Seleciona todos os pets com seus respectivos donos e raças
SELECT 
    PET.nome AS nome_pet,
    CLIENTE.nome AS nome_cliente,
    RACA.nome AS raca
FROM PET
JOIN CLIENTE ON PET.fk_cliente = CLIENTE.id_cliente
JOIN RACA ON PET.fk_raca = RACA.id_raca;

-- Exibe todos os agendamentos com nome do pet, dono e horários
SELECT 
    AGENDA.id_agenda,
    CLIENTE.nome AS cliente,
    PET.nome AS pet,
    AGENDA.data_hora_inicio,
    AGENDA.data_hora_fim
FROM AGENDA
JOIN PET ON AGENDA.fk_pet = PET.id_pet
JOIN CLIENTE ON PET.fk_cliente = CLIENTE.id_cliente;

-- Mostra todos os serviços realizados em agendamentos, com valores cobrados
SELECT 
    AGENDA.id_agenda,
    CLIENTE.nome AS cliente,
    PET.nome AS pet,
    SERVICO.nome AS servico,
    AGENDA_SERVICO.valor AS valor_final,
    AGENDA.data_hora_inicio
FROM AGENDA_SERVICO
JOIN AGENDA ON AGENDA_SERVICO.fk_agenda = AGENDA.id_agenda
JOIN PET ON AGENDA.fk_pet = PET.id_pet
JOIN CLIENTE ON PET.fk_cliente = CLIENTE.id_cliente
JOIN SERVICO ON AGENDA_SERVICO.fk_servico = SERVICO.id_servico;

-- Lista todas as despesas, produtos relacionados e categorias
SELECT 
    DESPESAS.id_despesas,
    PRODUTO.nome AS produto,
    CATEGORIA_DESPESAS.nome AS categoria,
    DESPESAS.valor,
    DESPESAS.data
FROM DESPESAS
JOIN PRODUTO ON DESPESAS.fk_produto = PRODUTO.id_produto
JOIN CATEGORIA_DESPESAS ON PRODUTO.fk_categoria_despesas = CATEGORIA_DESPESAS.id_categoria_despesas;

-- Mostra quais clientes têm pacotes e quando eles expiram
SELECT 
    CLIENTE.nome AS cliente,
    PACOTE.tipo AS tipo_pacote,
    CLIENTE_PACOTE.data_expiracao
FROM CLIENTE_PACOTE
JOIN CLIENTE ON CLIENTE_PACOTE.fk_cliente = CLIENTE.id_cliente
JOIN PACOTE ON CLIENTE_PACOTE.fk_pacote = PACOTE.id_pacote;

-- Lista todos os serviços disponíveis no sistema e seus valores base
SELECT 
    nome AS servico,
    valor_base
FROM SERVICO;

-- Lista todos os produtos e suas categorias
SELECT 
    PRODUTO.nome AS produto,
    CATEGORIA_DESPESAS.nome AS categoria
FROM PRODUTO
JOIN CATEGORIA_DESPESAS ON PRODUTO.fk_categoria_despesas = CATEGORIA_DESPESAS.id_categoria_despesas;

-- Mostra os pets e a raça associada a cada um
SELECT 
    PET.nome AS pet,
    RACA.nome AS raca
FROM PET
JOIN RACA ON PET.fk_raca = RACA.id_raca;

