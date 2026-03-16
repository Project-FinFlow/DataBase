DELIMITER //  /*Procedure de Criar Usuário.*/

CREATE PROCEDURE criar_usuario(
    IN p_nome VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_senha VARCHAR(255)
)
BEGIN

INSERT INTO usuario(nome,email,senha)
VALUES(p_nome,p_email,p_senha);

INSERT INTO logs(usuario_id,acao,tabela_afetada,descricao)
VALUES(LAST_INSERT_ID(),'INSERT','usuario','Novo usuário criado');

END //

DELIMITER ;

/*Procedure registro de receitas*/

DELIMITER //

CREATE PROCEDURE registrar_receita(
    IN p_usuario INT,
    IN p_categoria INT,
    IN p_valor DECIMAL(10,2),
    IN p_data DATE,
    IN p_descricao VARCHAR(255)
)
BEGIN

INSERT INTO receita(usuario_id,categoria_id,valor,data,descricao)
VALUES(p_usuario,p_categoria,p_valor,p_data,p_descricao);

INSERT INTO logs(usuario_id,acao,tabela_afetada,descricao)
VALUES(p_usuario,'INSERT','receita','Nova receita registrada');

END //

DELIMITER ;

/*Procedure registradora de despesas*/

DELIMITER //

CREATE PROCEDURE registrar_despesa(
    IN p_usuario INT,
    IN p_categoria INT,
    IN p_valor DECIMAL(10,2),
    IN p_data DATE,
    IN p_descricao VARCHAR(255),
    IN p_forma VARCHAR(50)
)
BEGIN

INSERT INTO despesas(usuario_id,categoria_id,valor,data,descricao,forma_pagamento)
VALUES(p_usuario,p_categoria,p_valor,p_data,p_descricao,p_forma);

INSERT INTO logs(usuario_id,acao,tabela_afetada,descricao)
VALUES(p_usuario,'INSERT','despesas','Nova despesa registrada');

END //

DELIMITER ;

/*Procedure meta financeira*/

DELIMITER //

CREATE PROCEDURE criar_meta(
    IN p_usuario INT,
    IN p_valor_meta DECIMAL(10,2),
    IN p_data_limite DATE,
    IN p_descricao VARCHAR(255)
)
BEGIN

INSERT INTO meta_financeira(usuario_id,valor_meta,data_limite,descricao)
VALUES(p_usuario,p_valor_meta,p_data_limite,p_descricao);

INSERT INTO logs(usuario_id,acao,tabela_afetada,descricao)
VALUES(p_usuario,'INSERT','meta_financeira','Nova meta criada');

END //

DELIMITER ;

/*Procedure LOGs*/

DELIMITER //

CREATE PROCEDURE registrar_log(
    IN p_usuario INT,
    IN p_acao VARCHAR(100),
    IN p_tabela VARCHAR(100),
    IN p_descricao TEXT
)
BEGIN

INSERT INTO logs(usuario_id,acao,tabela_afetada,descricao)
VALUES(p_usuario,p_acao,p_tabela,p_descricao);

END //

DELIMITER ;