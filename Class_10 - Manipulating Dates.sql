-- EXTRACT
SELECT 
    * 
FROM 
    transactions 
WHERE 
    -- GET ONLY TRANSACTIONS OF DAY OF THE WEEK IS IN THE MONDAY
    extract('dow' FROM transaction_date) = 1
;

-- DATE TRUNC
SELECT 
    transaction_date,
    DATE_TRUNC('day', transaction_date) AS transaction_day, 
    DATE_TRUNC('month', transaction_date) AS transaction_month,
    DATE_TRUNC('year', transaction_date) AS transaction_year
FROM 
    transactions 
GROUP BY 
    -- DATE_TRUNC('day', transaction_date) -- TRUNC BY DAY
    -- DATE_TRUNC('month', transaction_date) -- MONTH
    DATE_TRUNC('year', transaction_date) -- YEAR
;

-- DATE PART
SELECT 
    DATE_PART('dow', transaction_date) AS transaction_dow,
    AVG(transaction_amount) AS avg_transaction_total 
FROM 
    transactions 
GROUP BY 
    DATE_PART('dow', transaction_date)
ORDER BY 
    DATE_PART('dow', transaction_date)
;

-- DATEADD 
SELECT 
    * 
FROM 
    transactions 
WHERE 
    transaction_date BETWEEN '2023-01-01' AND '2023-01-01' + interval '7 days'
;
