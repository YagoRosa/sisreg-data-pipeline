import pyodbc

def testar_conexao_final():
    configuracoes = [
        "localhost",
        ".",
        "localhost\\MSSQLSERVER",
        ".\\MSSQLSERVER"
    ]
    
    for server in configuracoes:
        try:
            conn_str = (
                f"DRIVER={{ODBC Driver 17 for SQL Server}};"
                f"SERVER={server};"
                f"DATABASE=master;"
                f"Trusted_Connection=yes;"
            )
            conn = pyodbc.connect(conn_str)
            print(f"✅ CONECTADO: {server}")
            conn.close()
            return server
        except Exception as e:
            print(f"❌ FALHOU: {server} - {e}")
    
    return None

servidor = testar_conexao_final()
if servidor:
    print(f"\n🎯 USE NO SEU CÓDIGO: SERVER={servidor}")