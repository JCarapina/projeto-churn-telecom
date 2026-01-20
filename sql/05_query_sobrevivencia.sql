--3. CURVA DE SOBREVIVÊNCIA (COHORTS DE TEMPO)
-- Pergunta de Negócio: "Clientes com menos de 6 meses cancelam mais?"
-- Objetivo: Entender se o risco está na aquisição (novos) ou na base legada.

SELECT 
    CASE 
        WHEN tenure <= 6 THEN '0-6 Meses (Novos)'
        WHEN tenure <= 12 THEN '6-12 Meses'
        WHEN tenure <= 24 THEN '1-2 Anos'
        ELSE '2+ Anos (Fiéis)'
    END AS Faixa_Tempo_Casa,
    COUNT(customerid) as Qtd_Clientes,
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(customerid), 2) as Taxa_Churn
FROM tbl_churn_raw
GROUP BY 1
ORDER BY Taxa_Churn DESC;