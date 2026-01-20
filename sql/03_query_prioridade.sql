-- 1. LISTA DE PRIORIDADE
-- Pergunta de Negócio: "Quais clientes devo priorizar (Alto Valor + Alto Risco)?"
-- Objetivo: Gerar uma lista de ataque para o time de CS focar em quem paga acima da média.

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

