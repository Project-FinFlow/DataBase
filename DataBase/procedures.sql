USE metas_financeiras;
CREATE PROCEDURE listar_despesas_usuario(IN p_usuario INT)
BEGIN
SELECT *
FROM despesas
WHERE usuario_id = p_usuario;
END