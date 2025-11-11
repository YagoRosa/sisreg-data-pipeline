USE MeuBancoTeste;

TRUNCATE TABLE Solicitacoes;


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



