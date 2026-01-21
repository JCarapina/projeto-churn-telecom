#%%
import pandas as pd
import sqlite3
import os

#%%
# Caminhos
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CSV_PATH = os.path.join(BASE_DIR, 'data', 'raw', 'telco_churn.csv')
DB_PATH = os.path.join(BASE_DIR, 'data', 'telecom.db')

def ingest_data():
    print(" Carregando dados para o banco...")

    
    # O parametro 'na_values' ajuda o pandas a entender que espaço vazio " " é Nulo (NaN)
    df = pd.read_csv(CSV_PATH, na_values=" ") 
    df.columns = df.columns.str.replace(' ', '_').str.replace('-', '_').str.lower()
    conn = sqlite3.connect(DB_PATH)
    df.to_sql('tbl_churn_raw', conn, if_exists='replace', index=False)
    conn.close()
    print("Banco criado! Os dados estão brutos na tabela 'tbl_churn_raw'.")

if __name__ == "__main__":
    ingest_data()
# %%
