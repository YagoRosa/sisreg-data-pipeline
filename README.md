# 🩺 SISREG Data Pipeline

Pipeline em **SQL Server** para criação de estrutura de tabelas e carga automatizada de dados exportados do **SISREG** (Sistema de Regulação), simulando um processo **ETL** voltado à análise assistencial no **Power BI**.

## 🧩 Descrição dos Scripts

| Arquivo | Função |
|----------|--------|
| **01_create_database_and_table.sql** | Cria o banco de dados `SisregDB` e a tabela `Solicitacoes` com base na estrutura do arquivo CSV exportado do SISREG. |
| **02_bulk_insert_sisreg.sql** | Executa o carregamento (BULK INSERT) dos dados do arquivo CSV para dentro da tabela no SQL Server. |

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

- Criar uma *view* para consolidação de indicadores assistenciais.  
- Conectar o banco ao Power BI e criar um dashboard analítico.  
- Automatizar o carregamento via **SQL Agent Job** ou **Python Script**.

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
