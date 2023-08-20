-- PARTITION BY
SELECT DISTINCT
    region,
    salesperson,
    -- Somatório do 'Total de vendas' particionando sobre o region e salesperson 
    sum(sale_amount) over (partition by region, salesperson) AS total_sales,
    -- Média do 'Total de vendas' particionando sobre o region e salesperson 
    avg(sale_amount) over (partition by region, salesperson) AS median_sales
FROM 
    sales
;

-- RANK 
WITH sales_by_region AS (
    SELECT 
        region, 
        salesperson,
        sum(sale_amount) AS total_sales
    FROM 
        sales
    GROUP BY    
        region, salesperson
), rank_by_region AS (
    SELECT 
        sbr.region,
        sbr.salesperson,
        sbr.total_sales,
        RANK() OVER (partition by region order by total_sales DESC) AS rank_sales
    FROM 
        sales_by_region as sbr
)
SELECT  
    rbr.region,
    rbr.salesperson,
    rbr.total_sales
FROM 
    rank_by_region AS rbr
WHERE 
    rank_sales = 1 -- GET ONLY FIRST BY REGION
;
 
-- ROW_NUMBER & RANK & DENSE_RANK
SELECT
    salesperson,
    sale_amount, 
    ROW_NUMBER() over (order by sale_amount desc),
    RANK() over (order by sale_amount desc),
    DENSE_RANK() over (order by sale_amount desc) -- AVOID WRONG SEQUENTIAL
FROM 
    sales
;
