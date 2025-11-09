IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'MeuBancoTeste')
BEGIN
    CREATE DATABASE MeuBancoTeste;
END
GO

USE MeuBancoTeste;

CREATE TABLE Solicitacoes (
    solicitacao VARCHAR(200),
    codigo_interno VARCHAR(100),
    codigo_unificado VARCHAR(100),
    descricao_procedimento VARCHAR(500),
    cpf_profissional_executante VARCHAR(20),
    nome_profissional_executante VARCHAR(300),
    data_agendamento DATE,
    hr_agendamento TIME,
    tipo VARCHAR(150),
    cns VARCHAR(30),
    nome VARCHAR(300),
    dt_nascimento DATE,
    idade INT,
    idade_meses INT,
    nome_mae VARCHAR(300),
    tipo_logradouro VARCHAR(100),
    logradouro VARCHAR(300),
    complemento VARCHAR(200),
    numero_logradouro VARCHAR(50),
    bairro VARCHAR(150),
    cep VARCHAR(15),
    telefone VARCHAR(50),
    municipio VARCHAR(150),
    ibge VARCHAR(20),
    mun_solicitante VARCHAR(150),
    ibge_solicitante VARCHAR(20),
    cnes_solicitante VARCHAR(30),
    unidade_fantasia VARCHAR(300),
    sexo VARCHAR(20),
    data_solicitacao DATE,
    operador_solicitante VARCHAR(150),
    data_autorizacao DATE,
    operador_autorizador VARCHAR(150),
    valor_procedimento DECIMAL(15,2),
    situacao VARCHAR(150),
    cid VARCHAR(30),
    cpf_profissional_solicitante VARCHAR(20),
    nome_profissional_solicitante VARCHAR(300)
);

SELECT * FROM Solicitacoes