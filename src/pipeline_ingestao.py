import pandas as pd
import re
import os
import pyodbc
from datetime import datetime
import shutil

print("🚀 Iniciando pipeline...")

# =============== CAMINHO DOS ARQUIVOS =================
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_DIR = os.path.join(BASE_DIR, 'data')
RAW_DIR = os.path.join(DATA_DIR, 'raw')
LOGS_DIR = os.path.join(DATA_DIR, 'logs')
os.makedirs(LOGS_DIR, exist_ok=True)

# Arquivo de log (CSV)
arquivo_log = os.path.join(LOGS_DIR, 'erros_telefone.csv')

# Regex genérica para telefones
padrao_telefone = re.compile(r'^\(?\d{2}\)?\s?\d{4,5}-?\d{4}$')

def validar_telefone(telefone):
    numeros = re.split(r'[;,/]', str(telefone))
    for num in numeros:
        if not padrao_telefone.match(num.strip()):
            return False
    return True

def log_erro(telefone, linha):
    with open(arquivo_log, 'a', encoding='utf-8') as f:
        f.write(
            f"{datetime.now()};"
            f"Linha {linha};"
            f"Sem telefone informado;"
            f"{telefone}\n"
        )

# Leitura do CSV
csv_path = os.path.join(RAW_DIR, 'SISREG.csv')
df = pd.read_csv(csv_path, sep=';')

# Validação
for i, row in df.iterrows():
    telefone = row['telefone']
    if not validar_telefone(telefone):
        log_erro(telefone, i + 2)

print("Conectando ao servidor...")

# Conexão SQL
server = "localhost"
database = "MeuBancoTeste"

conn_str = (
    f"DRIVER={{ODBC Driver 17 for SQL Server}};"
    f"SERVER={server};"
    f"DATABASE={database};"
    f"Trusted_Connection=yes;"
)

conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

# SOLUÇÃO: Copiar arquivo para local que o SQL Server pode acessar
temp_dir = "C:/temp"
os.makedirs(temp_dir, exist_ok=True)
temp_csv_path = os.path.join(temp_dir, "SISREG_temp.csv")

# Copiar CSV para C:/temp (SQL Server tem acesso aqui)
shutil.copy2(csv_path, temp_csv_path)
print(f"📄 Arquivo copiado para: {temp_csv_path}")

# BULK INSERT
sql = f"""
BULK INSERT Dados
FROM '{temp_csv_path}'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\\n',
    FIRSTROW = 2,
    MAXERRORS = 1000,
    TABLOCK
);
"""

try:
    cursor.execute(sql)
    conn.commit()
    print("✅ Dados inseridos com sucesso!")
    
except pyodbc.ProgrammingError as e:
    print(f"⚠️  Erro no BULK INSERT: {e}")
    print("Tentando método alternativo (INSERT linha a linha)...")
    
    # Método alternativo: inserir linha a linha
    inseridos = 0
    for i, row in df.iterrows():
        try:
            telefone = row['telefone']
            cursor.execute("INSERT INTO Dados (telefone) VALUES (?)", telefone)
            inseridos += 1
        except Exception as e:
            print(f"Erro na linha {i+2}: {e}")
    
    conn.commit()
    print(f"✅ Inseridos {inseridos} registros (método alternativo)")

finally:
    # Limpar arquivo temporário
    if os.path.exists(temp_csv_path):
        os.remove(temp_csv_path)
    
    cursor.close()
    conn.close()

print("Pipeline concluída! Novos dados inseridos.")