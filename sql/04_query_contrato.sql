-- 2. Contrato e Risco de Churn
-- Pergunta de Negócio: "Qual tipo de contrato tem a maior taxa de evasão?"
-- Objetivo: Validar a hipótese de que contratos mensais são instáveis.
SELECT 
    contract,
    COUNT(customerid) as Total_Clientes,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as Total_Churn,
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(customerid), 2) as Taxa_Churn_Percent
FROM tbl_churn_raw
GROUP BY contract
ORDER BY Taxa_Churn_Percent DESC;