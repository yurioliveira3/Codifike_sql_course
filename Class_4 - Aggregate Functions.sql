-- COUNT 
SELECT 
    telefone,
    count(telefone) AS conta_telefone
FROM 
    mnc.tb_usuario tu 
GROUP BY 
    telefone;

-- MIN & MAX & AVG & SUM
SELECT 
    MIN(valor) AS menor_valor,
    MAX(valor) AS maior_valor,
    AVG(valor) AS media_valor,
    SUM(valor) AS somatorio_valor
FROM 
    mnc.tb_receita tr;
 
-- THIS 3 QUERYS DO THE SAME OPERATION
    SELECT * FROM mnc.tb_receita tr WHERE valor > 0 AND valor < 10;
    
    SELECT * FROM mnc.tb_receita tr WHERE valor BETWEEN 10 AND 20;
    
    SELECT * FROM mnc.tb_receita tr WHERE valor IN (10, 20, 30);
    