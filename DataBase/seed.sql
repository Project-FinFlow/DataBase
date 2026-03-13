USE metas_financeiras;

INSERT INTO usuario (nome, email, senha) VALUES
('Pedro Tavares', 'pedrotavares@email.com', '123456'),
('Ana Souza', 'ana@email.com', '123456'),
('Carlos Mendes', 'carlos@email.com', '123456'),
('Juliana Lima', 'juliana@email.com', '123456');

INSERT INTO categoria (nome, tipo, usuario_id) VALUES
('Salário', 'receita', 1),
('Freelance', 'receita', 1),
('Alimentação', 'despesa', 1),
('Transporte', 'despesa', 1),
('Lazer', 'despesa', 1),

('Salário', 'receita', 2),
('Alimentação', 'despesa', 2),

('Salário', 'receita', 3),
('Moradia', 'despesa', 3),

('Salário', 'receita', 4),
('Transporte', 'despesa', 4);

INSERT INTO saldo (usuario_id, saldo_atual, total_receitas, total_despesas) VALUES
(1, 1500.00, 2000.00, 500.00),
(2, 800.00, 1000.00, 200.00),
(3, 1200.00, 1500.00, 300.00),
(4, 600.00, 900.00, 300.00);

INSERT INTO receita (usuario_id, categoria_id, valor, data, descricao) VALUES
(1, 1, 2000.00, '2026-03-01', 'Salário mensal'),
(1, 2, 500.00, '2026-03-05', 'Projeto freelance'),

(2, 6, 1000.00, '2026-03-02', 'Salário'),

(3, 8, 1500.00, '2026-03-01', 'Salário empresa'),

(4, 10, 900.00, '2026-03-01', 'Salário');

INSERT INTO despesas (usuario_id, categoria_id, valor, data, descricao, forma_pagamento) VALUES
(1, 3, 120.00, '2026-03-02', 'Supermercado', 'Cartão'),
(1, 4, 60.00, '2026-03-03', 'Uber', 'Pix'),
(1, 5, 200.00, '2026-03-07', 'Cinema', 'Cartão'),

(2, 7, 200.00, '2026-03-04', 'Mercado', 'Pix'),

(3, 9, 300.00, '2026-03-05', 'Aluguel', 'Transferência'),

(4, 11, 80.00, '2026-03-03', 'Ônibus', 'Dinheiro');

INSERT INTO meta_financeira (usuario_id, valor_meta, valor_atual, data_limite, descricao) VALUES
(1, 5000.00, 1200.00, '2026-12-31', 'Comprar notebook'),
(2, 2000.00, 400.00, '2026-10-01', 'Viagem'),
(3, 3000.00, 800.00, '2026-09-01', 'Reserva de emergência'),
(4, 1500.00, 300.00, '2026-08-01', 'Curso online');

INSERT INTO logs (usuario_id, acao, tabela_afetada, descricao) VALUES
(1, 'INSERT', 'receita', 'Usuário adicionou salário'),
(1, 'INSERT', 'despesas', 'Usuário registrou supermercado'),

(2, 'INSERT', 'receita', 'Salário registrado'),

(3, 'INSERT', 'despesas', 'Pagamento de aluguel'),

(4, 'INSERT', 'meta_financeira', 'Usuário criou meta de curso');