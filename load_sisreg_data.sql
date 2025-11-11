USE MeuBancoTeste;

BULK INSERT Solicitacoes 
FROM 'caminho aqui'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    FIRSTROW = 2,
    CODEPAGE = '65001'

);
