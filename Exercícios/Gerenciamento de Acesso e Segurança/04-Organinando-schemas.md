# 🛠️ Resolução do Chamado #1062: Organização e Segurança por Schemas no SQL Server

## 🎯 Objetivo
Organizar a estrutura do banco de dados `LaboratorioDBA` utilizando **Schemas (Esquemas)** para agrupar tabelas por setor/domínio e otimizar a gestão de permissões de segurança em lote.

---

## 💡 Conceitos Aplicados
* **Schemas:** Pastas lógicas dentro do banco que separam objetos por responsabilidade/departamento (`Audit`, `Finan`, `RH`).
* **Segurança em Lote (`ON SCHEMA::`):** Aplicação de permissões diretamente no esquema, garantindo herança automática de acessos para tabelas existentes e futuras.
* **Isolamento de Dados:** Restrição rigorosa de escrita (`DENY UPDATE, DELETE`) no esquema de auditoria para garantir imutabilidade dos logs.

