USE MeuBancoTeste;

BULK INSERT Solicitacoes 
FROM 'C:\Users\yagos\Documents\Projetos\Projeto 1 - SISREG Data Pipeline\SISREG.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    FIRSTROW = 2,
    CODEPAGE = '65001'
);