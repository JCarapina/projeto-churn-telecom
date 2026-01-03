-- DDL para garantir que as variáveis de ambiente estejam definidas corretamente
-- e criar a tabela telco_churn no banco de dados.
CREATE TABLE IF NOT EXISTS telco_churn (
    customer_id VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(20),
    senior_citizen INT,
    partner VARCHAR(10),
    dependents VARCHAR(10),
    tenure INT,
    phone_service VARCHAR(10),
    multiple_lines VARCHAR(50),
    internet_service VARCHAR(50),
    online_security VARCHAR(50),
    online_backup VARCHAR(50),
    device_protection VARCHAR(50),
    tech_support VARCHAR(50),
    streaming_tv VARCHAR(50),
    streaming_movies VARCHAR(50),
    contract VARCHAR(50),
    paperless_billing VARCHAR(10),
    payment_method VARCHAR(50),
    monthly_charges FLOAT,
    total_charges FLOAT, 
    churn VARCHAR(10)
);