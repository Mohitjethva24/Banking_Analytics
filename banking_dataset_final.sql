create database banking_project;
use banking_project;
select * from banking_dataset_final;

-- How much money is flowing through the bank?
SELECT 
    SUM(transaction_amount) AS total_transaction_value,
    COUNT(*) AS total_transactions
FROM banking_dataset_final;

-- Which branch is performing best?
SELECT 
    branch,
    SUM(transaction_amount) AS total_amount
FROM banking_dataset_final
GROUP BY branch;

-- Who are the most valuable customers?
SELECT 
    customer_name,
    SUM(transaction_amount) AS total_spent
FROM banking_dataset_final
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;


-- Deposits vs Withdrawals distribution
SELECT 
    transaction_type,
    COUNT(*) AS total_count,
    SUM(transaction_amount) AS total_amount
FROM banking_dataset_final
GROUP BY transaction_type;


-- How transactions change over time
SELECT 
    year,
    month_name,
    SUM(transaction_amount) AS total_amount
FROM banking_data
GROUP BY year, month
ORDER BY year, month;