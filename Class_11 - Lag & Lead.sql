-- DELTA (LAG)
SELECT 
    customer_id,
    transaction_date,
    transaction_amount,
    transaction_amount - LAG(transaction_amount) -- OPTIONAL DAYS TO CALCULATE, DEFAULT = 1
                            OVER 
                        (partition by customer_id ORDER BY transaction_date) AS delta
FROM 
    sales
;

-- LEAD
SELECT 
    customer_id,
    transaction_date,
    transaction_amount,
    transaction_amount - LEAD(transaction_amount) -- OPTIONAL DAYS TO CALCULATE, DEFAULT = 1
                            OVER 
                        (partition by customer_id ORDER BY transaction_date) AS delta
FROM 
    sales
;
