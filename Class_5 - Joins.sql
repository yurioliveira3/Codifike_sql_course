-- JOIN == INNER JOIN
SELECT 
    u.nome,
    r.titulo,
    r.ingredientes  
FROM
    mnc.tb_usuario AS u
JOIN  
    mnc.tb_receita AS r ON (u.id = r.id_usuario);

-- LEFT JOIN 
SELECT 
    u.nome,
    r.titulo,
    r.ingredientes  
FROM
    mnc.tb_usuario AS u
LEFT JOIN  
    mnc.tb_receita AS r ON (u.id = r.id_usuario)
ORDER BY 
    u.id;
    
-- RIGHT JOIN
SELECT 
    u.nome,
    r.titulo,
    r.ingredientes  
FROM
    mnc.tb_usuario AS u
RIGHT JOIN  
    mnc.tb_receita AS r ON (u.id = r.id_usuario)
WHERE 
        r.valor  < 10 
    AND r.ingredientes ILIKE '%Carne%'
ORDER BY 
    u.id;

-- CROSS JOIN = JOIN TRUE
SELECT 
    u.nome,
    r.titulo,
    r.ingredientes  
FROM
    mnc.tb_usuario AS u
JOIN  
    mnc.tb_receita AS r ON (TRUE)
WHERE 
        r.valor  < 10 
    AND r.ingredientes ILIKE '%Carne%'
ORDER BY 
    u.id;
