CREATE DATABASE  metas_financeiras;
USE metas_financeiras;

CREATE TABLE usuario (

    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL

);

CREATE TABLE categoria (

    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM('receita','despesa') NOT NULL,
    usuario_id INT,
    
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE receita (
    
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    categoria_id INT,
    valor DECIMAL(10,2) NOT NULL,
    data DATE,
    descricao VARCHAR(255),

    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE despesas (

    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    categoria_id INT,
    valor DECIMAL(10,2) NOT NULL,
    data DATE,
    descricao VARCHAR(255),
    forma_pagamento VARCHAR(50),

    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE meta_financeira (

    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    valor_meta DECIMAL(10,2) NOT NULL,
    valor_atual DECIMAL(10,2) DEFAULT 0,
    data_limite DATE,
    descricao VARCHAR(255),

    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE saldo (

    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNIQUE,
    saldo_atual DECIMAL(10,2),
    total_receitas DECIMAL(10,2),
    total_despesas DECIMAL(10,2),

    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE logs (

    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    acao VARCHAR(100),
    tabela_afetada VARCHAR(100),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao TEXT,

    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);