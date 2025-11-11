IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'MeuBancoTeste')
BEGIN
    CREATE DATABASE MeuBancoTeste;
END
GO

USE MeuBancoTeste;

CREATE TABLE Dados (
    solicitacao BIGINT,
    codigo_interno BIGINT,
    codigo_unificado BIGINT,
    descricao_procedimento NVARCHAR(500),
    cpf_proficional_executante NVARCHAR(20),
    nome_profissional_executante NVARCHAR(255),
    data_agendamento NVARCHAR(10),
    hr_agendamento NVARCHAR(8),
    tipo INT,
    cns NVARCHAR(20),
    nome NVARCHAR(255),
    dt_nascimento NVARCHAR(10),
    idade INT,
    idade_meses INT,
    nome_mae NVARCHAR(255),
    tipo_logradouro NVARCHAR(50),
    logradouro NVARCHAR(255),
    complemento NVARCHAR(255),
    numero_logradouro NVARCHAR(50),
    bairro NVARCHAR(100),
    cep NVARCHAR(10),
    telefone NVARCHAR(1000),
    municipio NVARCHAR(100),
    ibge NVARCHAR(10),
    mun_solicitante NVARCHAR(100),
    ibge_solicitante NVARCHAR(10),
    cnes_solicitante NVARCHAR(20),
    unidade_fantasia NVARCHAR(500),
    sexo NVARCHAR(1),
    data_solicitacao NVARCHAR(10),
    operador_solicitante NVARCHAR(100),
    data_autorizacao NVARCHAR(10),
    operador_autorizador NVARCHAR(100),
    valor_procedimento DECIMAL(10,2),
    situacao NVARCHAR(50),
    cid NVARCHAR(10),
    cpf_profissional_solicitante NVARCHAR(20),
    nome_profissional_solicitante NVARCHAR(255)
);

SELECT * FROM Dados