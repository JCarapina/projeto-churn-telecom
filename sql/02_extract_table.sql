-- Checagem de sanidade
-- Checagem de qualidade
-- Qual é o tamanho do nosso problema de negócio?

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

-- Levantado possiveis Hipoteses para o problema de churn
-- Clientes mais novos (menor tenure) ou mais antigos (maior tenure) tem mais churn?
-- R: Clientes mais novos tem uma taxa de churn significativamente maior
SELECT
    CASE 
        WHEN tenure <= 12 THEN '0-1 Ano'
        WHEN tenure <= 24 THEN '1-2 Anos'
        WHEN tenure <= 48 THEN '2-4 Anos'
        ELSE '4+ Anos'
    END AS faixa_tempo,
    COUNT(*) AS total_clientes,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS total_churn,
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / (SELECT COUNT(*) FROM tbl_churn_raw), 2) AS taxa_churn
    FROM tbl_churn_raw
    GROUP BY 1
    ORDER BY taxa_churn DESC;