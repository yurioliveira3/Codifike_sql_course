-- CTE (Common Table Expressions)
WITH sales_data AS (
    SELECT 
        customer_id,
        SUM(total_amount) AS total_sales,
    FROM 
        orders 
    GROUP BY 
        customer_id
), top_customers AS (
    SELECT 
        customer_id,
        total_sales
    FROM 
        sales_data 
    ORDER BY 
        total_sales DESC 
    LIMIT 10
)
SELECT 
    c.customer_name,
    tc.total_sales
FROM 
    customers as c 
JOIN 
    top_customers AS tc ON (c.customer_id = tc.customer_id)
;

-- RECURSIVE CTE
WITH RECURSIVE employee_hierarchy AS (
    -- BASE CASE
    SELECT 
        id,
        name,
        manager_id,
        ARRAY[id] AS "path"
    FROM 
        employees
    WHERE 
        manager_id IS NULL
    UNION ALL 
    -- RECURSIVE "CONSULT"
    SELECT 
        es.id,
        es.name,
        es.manager_id,
        eh.path || es.id AS "path"
    FROM 
        employees AS es 
    JOIN 
        employee_hierarchy AS eh ON (es.manager_id = eh.id)
) 
SELECT 
    "name",
    "path"  
FROM
    employee_hierarchy 
;
