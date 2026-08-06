# 📘 Exercício 02 — Controle de Acesso e Auditoria (Chamado #1060)

**Autor(a):** Thaynara  
**Data:** 01/08/2026  
**Banco de Dados:** `LaboratorioDBA`  

---

## 📋 Enunciado da Questão
> **Chamado de Compliance #1060:**  
> O novo analista de auditoria (`Lucas`) precisa ter acesso ao banco de dados `LaboratorioDBA` para consultar as informações contidas na tabela de funcionários. No entanto, em conformidade com as regras rígidas de segurança e integridade de dados da empresa, a conta dele deve ser **expressamente bloqueada** contra qualquer tentativa de alteração ou exclusão de registros na tabela de auditoria.

---

## 🎯 Requisitos a Cumprir

1. **Criação de Credencial de Acesso:** Criar o Login `usr_Lucas` no servidor SQL Server com autenticação via senha.
2. **Estruturação da Tabela de Auditoria:** Garantir a existência da tabela `dbo.Auditoria` com campo temporal automático para registro de logs.
3. **Mapeamento de Usuário:** Mapear o login `usr_Lucas` para a base de dados `LaboratorioDBA`.
4. **Criação de Role de Segurança:** Criar a Database Role `role_auditoria` para gerenciamento centralizado de acessos.
5. **Aplicação de Regras de Leitura:** Conceder permissão explícita de consulta (`GRANT SELECT`) na tabela `dbo.Funcionarios` para a `role_auditoria`.
6. **Aplicação de Regras de Bloqueio:** Aplicar bloqueio explícito de alteração e exclusão (`DENY UPDATE, DELETE`) na tabela `dbo.Auditoria` para a `role_auditoria`.
7. **Atribuição de Papel:** Incluir o usuário `usr_Lucas` como membro da `role_auditoria`.

---

## 🧠 Conceitos Praticados

* **Hierarquia de Permissões (`GRANT` vs `DENY`):** Compreensão prática de que uma regra de `DENY` (negação) tem precedência sobre qualquer permissão concedida.
* **Princípio do Menor Privilégio:** Limitação rigorosa dos acessos ao estritamente necessário para o desempenho da função de auditoria.
* **Segurança e Imutabilidade de Dados:** Garantia de que tabelas sensíveis (como logs e auditorias) fiquem protegidas contra alterações acidentais ou maliciosas.
* **Validação via Tabelas de Sistema:** Utilização das visões de catálogo (`sys.database_permissions` e `sys.database_role_members`) para auditar as permissões ativas.

---