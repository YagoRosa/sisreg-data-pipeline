/*
===========================================
🧩 SISREG Data Pipeline — Etapa de Ingestão
===========================================

💡 Descrição:
Este script executa a carga de dados do arquivo CSV exportado do SISREG para o banco de dados SQL Server,
simulando a etapa de ingestão (Extract & Load) de um pipeline de dados.

⚙️ Ajustes aplicados:
- FIELDQUOTE: para tratar campos delimitados por aspas duplas;
- TABLOCK: otimização da operação de carregamento em massa;
- TRUNCATE TABLE: limpeza prévia da tabela para evitar duplicidades;
- ERRORFILE: registro de linhas com erro de carga para diagnóstico detalhado.

🧠 Insights técnicos:
Os registros gerados pelo parâmetro ERRORFILE foram fundamentais para diagnosticar as causas dos erros de carga.
Dada a importância desse tipo de log para o processo de ingestão, serão desenvolvidas rotinas de tratamento
automatizado de erros, permitindo identificar e corrigir inconsistências de forma mais ágil e estruturada
em futuras execuções do pipeline.

📍 Observação:
Foram identificadas inconsistências no formato original do arquivo SISREG, exigindo ajustes finos no delimitador
e na codificação dos dados para garantir a leitura correta.
*/

USE MeuBancoTeste;

TRUNCATE TABLE Dados;

BULK INSERT Dados 
FROM 'C:\Users\yagos\Documents\Projetos\sisregPipeline\SISREG.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ';',
    FIELDQUOTE = '"',  -- Importante: campos entre aspas
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    ERRORFILE = 'C:\Users\yagos\Documents\Projetos\sisregPipeline\erros',
    MAXERRORS = 1000,
    TABLOCK
);

SELECT * FROM Dados
DROP TABLE Dados
