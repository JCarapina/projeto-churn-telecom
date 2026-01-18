-- Visualizando as 10 primeiras linhas da tabela
SELECT * FROM tbl_churn_raw LIMIT 10;

-- Checando nulos
-- R:Total de 11 nulos no charges, no python vamos tratar esses casos
SELECT 
    COUNT(*) AS total_linhas,
    SUM(CASE WHEN customerid IS NULL THEN 1 ELSE 0 END) AS nulos_id,
    SUM(CASE WHEN churn IS NULL THEN 1 ELSE 0 END) AS nulos_churn,
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS nulos_tenure,
    SUM(CASE WHEN monthlycharges IS NULL THEN 1 ELSE 0 END) AS nulos_monthlycharges,
    SUM(CASE WHEN totalcharges IS NULL THEN 1 ELSE 0 END) AS nulos_totalcharges
FROM tbl_churn_raw;


-- Verificando a taxa de churn, para saber o tamanho do problema
-- R: Verificamos que o dataset esta desbalanceado, com cerca de 26.5% de churn
SELECT
    churn,
    COUNT(*) AS qtd_clientes,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM tbl_churn_raw), 2) AS perc_churn
    FROM tbl_churn_raw
    GROUP BY churn;

