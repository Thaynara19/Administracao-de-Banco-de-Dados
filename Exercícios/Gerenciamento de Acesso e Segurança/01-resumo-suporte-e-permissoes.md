# 📘 Exercício 01 — Gestão de Acessos e Permissões (Chamado Suporte)

**Autor(a):** Thaynara  
**Data:** 31/07/2026  
**Banco de Dados:** `LaboratorioDBA`  

---

## 📋 Enunciado da Questão
> **Chamado de Suporte #1059:**  
> A nova analista da equipe de suporte (`Mariana`) precisa consultar dados da tabela de funcionários no banco de dados `LaboratorioDBA`. Por questões de segurança e governança, ela **não** deve ter permissão de acesso direto via conta de administrador e **não** pode alterar nenhum registro.

---

## 🎯 Requisitos a Cumprir
1. **Criação de Credencial de Acesso:** Criar o Login `usr_Mariana` no servidor SQL Server com a senha `'Suporte#2026'`.
2. **Mapeamento de Usuário:** Mapear a conta para a base de dados `LaboratorioDBA`.
3. **Criação de Grupo de Acesso (Role):** Criar a Database Role `role_suporte`.
4. **Concessão de Privilégios:** Liberar apenas a leitura (`SELECT`) na tabela `dbo.Funcionarios` para a `role_suporte`.
5. **Vinculação:** Associar a usuária `usr_Mariana` à `role_suporte`.

---

## 🧠 Conceitos Praticados
* **Princípio do Menor Privilégio:** Conceder apenas o acesso necessário para a função de suporte.
* **Database Roles:** Agrupar permissões em papéis em vez de aplicar privilégios diretamente a usuários individuais.
