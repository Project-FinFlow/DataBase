DELIMITER //  /*Triggers receita.*/

CREATE TRIGGER after_insert_receita
AFTER INSERT ON receita
FOR EACH ROW
BEGIN

UPDATE saldo
SET 
    saldo_atual = saldo_atual + NEW.valor,
    total_receitas = total_receitas + NEW.valor
WHERE usuario_id = NEW.usuario_id;

END //

DELIMITER ;

/*Triggers despesa.*/
 
DELIMITER //

CREATE TRIGGER after_insert_despesa
AFTER INSERT ON despesas
FOR EACH ROW
BEGIN

UPDATE saldo
SET 
    saldo_atual = saldo_atual - NEW.valor,
    total_despesas = total_despesas + NEW.valor
WHERE usuario_id = NEW.usuario_id;

END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER log_receita_auto
AFTER INSERT ON receita
FOR EACH ROW
BEGIN

INSERT INTO logs(usuario_id,acao,tabela_afetada,descricao)
VALUES(NEW.usuario_id,'INSERT','receita','Receita adicionada automaticamente');

END //

DELIMITER ;

/*Triggers para impedir saldo negativo*/

DELIMITER //

CREATE TRIGGER before_insert_despesa
BEFORE INSERT ON despesas
FOR EACH ROW
BEGIN

DECLARE saldo_atual_usuario DECIMAL(10,2);

SELECT saldo_atual
INTO saldo_atual_usuario
FROM saldo
WHERE usuario_id = NEW.usuario_id;

IF saldo_atual_usuario < NEW.valor THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Saldo insuficiente';
END IF;

END //

DELIMITER ;
