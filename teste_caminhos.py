import os

print("Testando caminhos...")
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_DIR = os.path.join(BASE_DIR, 'data')
RAW_DIR = os.path.join(DATA_DIR, 'raw')
LOGS_DIR = os.path.join(DATA_DIR, 'logs')

print(f"BASE_DIR: {BASE_DIR}")
print(f"DATA_DIR: {DATA_DIR}")
print(f"RAW_DIR: {RAW_DIR}")
print(f"LOGS_DIR: {LOGS_DIR}")

print(f"\nExiste data/? {os.path.exists(DATA_DIR)}")
print(f"Existe data/raw/? {os.path.exists(RAW_DIR)}")
print(f"Existe data/logs/? {os.path.exists(LOGS_DIR)}")

# Listar arquivos em raw
if os.path.exists(RAW_DIR):
    print(f"\nArquivos em raw: {os.listdir(RAW_DIR)}")
else:
    print(f"\nA pasta raw não existe em {RAW_DIR}")

# Listar arquivos em logs
if os.path.exists(LOGS_DIR):
    print(f"Arquivos em logs: {os.listdir(LOGS_DIR)}")
else:
    print(f"A pasta logs não existe em {LOGS_DIR}")