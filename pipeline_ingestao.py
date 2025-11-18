import pyodbc

# Configuração da conexão
server = "localhost" 
database = "MeuBancoTeste" 
conn_str = (
    f"DRIVER={{ODBC Driver 17 for SQL Server}};"
    f"SERVER={server};"
    f"DATABASE={database};"
    f"Trusted_Connection=yes;"
)

try:
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()

    # Comando BULK INSERT
    sql = r"""
    BULK INSERT Dados
    FROM 'C:\Users\yagos\Documents\Projetos\sisregPipeline\SISREG.csv'
    WITH (
        FORMAT = 'CSV',
        FIELDTERMINATOR = ';',
        FIELDQUOTE = '"',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2,
        ERRORFILE = 'C:\Users\yagos\Documents\Projetos\sisregPipeline\erros',
        MAXERRORS = 1000,
        TABLOCK
    );"""

    cursor.execute(sql)
    conn.commit()
    print("✅ BULK INSERT executado com sucesso.")

except pyodbc.Error as e:
    print(f"❌ Erro ao executar BULK INSERT: {e}")

finally:
    cursor.close()
    conn.close()

