
-- Pergunta de Negócio: "Clientes com mais serviços contratados churnam menos?"
-- Objetivo: Validar se oferecer 'Upsell' (vender mais serviços) ajuda a segurar o cliente.

SELECT 
    -- Soma as colunas de "Yes" (transformando em 1) para contar serviços extras
    (CASE WHEN OnlineSecurity='Yes' THEN 1 ELSE 0 END +
     CASE WHEN OnlineBackup='Yes' THEN 1 ELSE 0 END +
     CASE WHEN DeviceProtection='Yes' THEN 1 ELSE 0 END +
     CASE WHEN TechSupport='Yes' THEN 1 ELSE 0 END +
     CASE WHEN StreamingTV='Yes' THEN 1 ELSE 0 END +
     CASE WHEN StreamingMovies='Yes' THEN 1 ELSE 0 END) as Qtd_Servicos_Extras,
    COUNT(customerID) as Total_Clientes,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(customerID), 2) as Taxa_Churn
FROM tbl_churn_raw
GROUP BY 1
ORDER BY 1 ASC