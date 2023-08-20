-- Subquery
SELECT 
    * 
FROM 
    orders AS odr
WHERE 
    odr.customer_id IN (
        SELECT 
            ct.customer_id 
        FROM 
            customers AS ct
        WHERE 
            ct.country = 'USA' 
    )
;

-- Many Subquerys [ Slow Verry Slow!! ]
SELECT
    * 
FROM 
    sales 
WHERE 
    product_id IN (
        SELECT 
            product_id 
        FROM 
            products 
        WHERE 
            category_id IN (
                SELECT 
                    category_id 
                FROM 
                    categories
                WHERE 
                    department_id IN (
                        SELECT 
                            department_id
                        FROM 
                            departments
                        WHERE 
                            department_name = 'Clothing'
                    )
            )
    )
;

-- Inline Subqueries
SELECT 
    customer_name,
    (
        SELECT 
            count(0) AS qtd
        FROM 
            orders AS o
        WHERE 
            o.customer_id = c.customer_id
    )
FROM 
    customers AS c
;
