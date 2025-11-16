# 🩺 SISREG Data Pipeline

Pipeline em **SQL Server** para criação de estrutura de tabelas e carga automatizada de dados exportados do **SISREG** (Sistema de Regulação), simulando um processo **ETL** voltado à análise assistencial no **Power BI**.

## 🧩 Descrição dos Scripts

| Arquivo | Função |
|----------|--------|
| **01_create_database_and_table.sql** | Cria o banco de dados `SisregDB` e a tabela `Solicitacoes` com base na estrutura do arquivo CSV exportado do SISREG. |
| **02_bulk_insert_sisreg.sql** | Executa o carregamento (BULK INSERT) dos dados do arquivo CSV para dentro da tabela no SQL Server. |
| **03_bulk_insert_sisreg.py** | Executa o carregamento (BULK INSERT) porem em Python. |

---

## 🚀 Objetivo

Demonstrar um processo de ingestão e tratamento inicial de dados **assistenciais**, simulando uma rotina real de **integração entre sistemas hospitalares** e um **banco de dados relacional** para posterior análise no Power BI.

---

## 🧠 Stack Utilizada

- **SQL Server 2019+**
- **Transact-SQL (T-SQL)**
- **CSV exportado do SISREG**
- **Power BI (visualização dos dados)**

---

## 📊 Próximos Passos

1. **Criar uma view de indicadores assistenciais**
   - Consolidar informações como quantidade de solicitações, especialidades e situação dos agendamentos.
   - Padronizar datas e códigos de procedimento para análise.

2. **Conectar o banco ao Power BI**
   - Usar a conexão nativa com SQL Server:
     ```
     Servidor: localhost
     Banco de Dados: SisregDB
     Autenticação: Windows ou SQL Login
     ```
   - Importar a tabela `Solicitacoes` e criar medidas DAX para:
     - Total de solicitações
     - Taxa de autorização
     - Tempo médio entre solicitação e agendamento
     - Distribuição por tipo e sexo

3. **Automatizar o pipeline**
   - Agendar a execução do `02_bulk_insert_sisreg.sql` via **SQL Server Agent** ou **Python (pyodbc)**.
   - Integrar com Power BI para atualização automática dos relatórios.

---

## 🧭 Roadmap de Evolução

- [ ] Adicionar script de criação da view `vw_Indicadores_Sisreg`
- [ ] Subir dashboard Power BI conectado ao banco
- [ ] Documentar fluxo completo no README
- [ ] Publicar visualização no Power BI Service

---

## ⚠️ Observações

- Os dados utilizados são apenas **exemplos fictícios**.  
- Não há nenhum dado real de pacientes ou profissionais de saúde.  
- O projeto tem **fins didáticos e de portfólio**.

---

## 📎 Autor

**Yago Santanna (Yaguin)**  
Auxiliar Administrativo & Desenvolvedor Júnior em transição para a área de dados.  
💼 Foco em análise de dados, automação de processos e indicadores assistenciais.

[LinkedIn](https://www.linkedin.com/in/yagosantanna) | [GitHub](https://github.com/Yaguin)
