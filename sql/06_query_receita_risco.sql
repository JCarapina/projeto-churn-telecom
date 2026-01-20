-- 4. ONDE ESTÁ O DINHEIRO PERDIDO? (RECEITA EM RISCO)
-- Pergunta de Negócio: "Qual serviço de internet gera maior perda financeira?"
-- Objetivo: Identificar sangramentos de receita para ajuste de produto/preço

SELECT 
    InternetService,
    ROUND(SUM(MonthlyCharges), 2) as Receita_Perdida_Mensal
FROM tbl_churn_raw
WHERE Churn = 'Yes'
GROUP BY InternetService
ORDER BY Receita_Perdida_Mensal DESC;