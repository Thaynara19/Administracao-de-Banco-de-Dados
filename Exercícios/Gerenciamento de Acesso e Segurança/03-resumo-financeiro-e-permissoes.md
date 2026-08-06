# 📘 Exercício 03 — Gestão de Acessos ao Setor Financeiro (Chamado #1061)

**Autor(a):** Thaynara  
**Data:** 03/08/2026  
**Banco de Dados:** `LaboratorioDBA`  

---

## 📋 Enunciado da Questão
> **Chamado Financeiro #1061:**  
> A nova analista financeira (`Renata`) precisa ter acesso ao banco de dados `LaboratorioDBA` para registrar novos pagamentos e consultar o histórico da tabela `dbo.Pagamentos`. No entanto, em conformidade com as normas rígidas de controle financeiro da empresa, a conta dela deve ter autorização para **inserção e consulta**, porém ser **expressamente bloqueada** contra qualquer tentativa de alteração (`UPDATE`) ou exclusão (`DELETE`) de registros existentes.

---

## 🎯 Requisitos a Cumprir

1. **Garantia da Tabela:** Verificar a existência da tabela `dbo.Pagamentos` com campos essenciais (`ID`, `DataPagamento`, `Valor`, `Descricao`).
2. **Criação de Credencial:** Criar o Login `usr_Renata` no servidor SQL Server com senha forte (`Finan#2026`).
3. **Mapeamento de Usuário:** Mapear o login `usr_Renata` para a base de dados `LaboratorioDBA`.
4. **Criação de Role de Segurança:** Criar a Database Role `role_financeiro` para gestão centralizada do grupo de trabalho.
5. **Aplicação de Permissões de Escrita e Leitura:** Conceder permissão explícita de consulta e inserção (`GRANT SELECT, INSERT`) na tabela `dbo.Pagamentos` para a `role_financeiro`.
6. **Aplicação de Regras de Bloqueio:** Aplicar bloqueio explícito de alteração e exclusão (`DENY UPDATE, DELETE`) na tabela `dbo.Pagamentos` para a `role_financeiro`.
7. **Atribuição de Papel:** Incluir a usuária `usr_Renata` como membro da `role_financeiro`.

---

## 🧠 Conceitos Praticados

* **Concessão Combinada (`GRANT SELECT, INSERT`):** Atribuição de múltiplas permissões simultâneas em um único grupo de acesso.
* **Precedência de Bloqueio (`DENY`):** Proteção de histórico financeiro garantindo que registros efetuados não possam ser manipulados ou apagados.
* **Gerenciamento de Usuários por Grupos (Roles):** Aplicação de permissões diretamente na Role (`role_financeiro`) em vez do usuário individual, facilitando a manutenção e a auditoria do banco.
* **Validação de Políticas de Segurança:** Consulta de visões de catálogo do sistema para auditar as regras e membros associados.

