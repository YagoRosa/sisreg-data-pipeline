-- TESTE DE CONEXÃO COM SQL SERVER
-- ===============================

-- 1. Teste básico - Versão do SQL Server
SELECT 
    @@VERSION AS 'Versão do SQL Server',
    @@SERVERNAME AS 'Nome do Servidor',
    DB_NAME() AS 'Banco de Dados Atual';

-- 2. Listar todos os bancos de dados do servidor
SELECT name AS 'Nome do Banco', 
       state_desc AS 'Estado',
       create_date AS 'Data de Criação'
FROM sys.databases 
ORDER BY name;

-- 3. Teste de data/hora do servidor
SELECT GETDATE() AS 'Data e Hora do Servidor';

-- 4. Criar uma tabela temporária para teste (não afeta seu banco)
CREATE TABLE #TesteTemp (
    ID INT IDENTITY(1,1),
    Mensagem VARCHAR(100),
    DataTeste DATETIME
);

-- 5. Inserir dados de teste
INSERT INTO #TesteTemp (Mensagem, DataTeste)
VALUES 
    ('Conexão com VSCode funcionando!', GETDATE()),
    ('Teste realizado com sucesso!', GETDATE());

-- 6. Consultar os dados inseridos
SELECT * FROM #TesteTemp;

-- 7. Limpar a tabela temporária (opcional)
DROP TABLE #TesteTemp;

-- 8. Teste final - Informações do usuário conectado
SELECT 
    SUSER_NAME() AS 'Usuário do SQL Server',
    SYSTEM_USER AS 'Usuário do Windows',
    HOST_NAME() AS 'Nome do Computador';