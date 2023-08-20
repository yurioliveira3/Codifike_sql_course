Execution query order: 
1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT 
6. DISTINCT
7. UNION 
8. ORDER BY 
9. LIMIT/TOP*

SELECT 
    SUBSTR(name,1,1) AS "Word",
    count(name) AS qtd
FROM 
    recipe
GROUP BY 
    -- "Word"
    SUBSTR(name,1,1);
