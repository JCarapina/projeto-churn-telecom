-- Pergunta: Quais clientes pagam acima da média e cancelaram? (Prioridade de Retenção)
WITH MediaMensal AS (
    SELECT AVG(monthlycharges) as Valor_Medio FROM tbl_churn_raw
)
SELECT 
    customerid,
    monthlycharges,
    contract,
    tenure
FROM tbl_churn_raw, MediaMensal
WHERE churn = 'Yes' 
  AND monthlycharges > MediaMensal.Valor_Medio
ORDER BY monthlycharges DESC
LIMIT 50;

