SELECT 
    InternetService,
    ROUND(SUM(MonthlyCharges), 2) as Receita_Perdida_Mensal
FROM tbl_churn_raw
WHERE Churn = 'Yes'
GROUP BY InternetService
ORDER BY Receita_Perdida_Mensal DESC;