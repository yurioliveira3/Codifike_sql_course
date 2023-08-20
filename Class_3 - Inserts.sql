-- INSERT ROWS INTO A TABLE
INSERT INTO mnc.tb_usuario (
    nome,
    doc,
    telefone
)
VALUES
    ('Yuri Teste1','44356442075', NULL),
    ('Yuri Teste2','40583110029', '981220035'),
    ('Yuri Teste3','84019811075', NULL)
;

INSERT INTO mnc.tb_receita  (
    titulo,
    ingredientes,
    valor,
    como_fazer,
    id_usuario 
)
VALUES
(
    'Brigadeiro',
    'Nescau, Margarina e Leite Condensado',
    2.50,
    'Misture os ingredientes',
    2
)
;
