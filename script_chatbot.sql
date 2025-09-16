CREATE DATABASE chatbot;
USE chatbot;

CREATE TABLE chat (
    id INTEGER PRIMARY KEY,
    passo_atual VARCHAR(255),
    dados_contexto JSON,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE cliente (
    id INTEGER PRIMARY KEY
);

CREATE TABLE chat_cliente (
    chat_id INTEGER PRIMARY KEY,
    cliente_id INTEGER NOT NULL UNIQUE,
	FOREIGN KEY(chat_id) REFERENCES chat(id),
    FOREIGN KEY(cliente_id) REFERENCES cliente(id)
);

SELECT
    chat.id AS chat_id,
    chat.passo_atual,
    chat.dados_contexto,
    chat.data_atualizacao,
    cliente.id AS cliente_id
FROM chat
JOIN chat_cliente ON chat.id = chat_cliente.chat_id
JOIN cliente ON chat_cliente.cliente_id = cliente.id;