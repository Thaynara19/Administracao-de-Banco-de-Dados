# Exercício - Backup e Recuperação (SQL Server)

Data: 06/08/2026

## O que pratiquei
- Alteração do modelo de recuperação para FULL.
- Backup completo do banco de dados.
- Backup diferencial.
- Backup do log de transações.
- Verificação da integridade do banco com DBCC CHECKDB.
- Verificação da integridade de tabelas com DBCC CHECKTABLE.

## Dificuldades encontradas
- Erro de permissão ao salvar o backup na área de trabalho.
- Entendimento da dependência entre backup completo, diferencial e de log.

## Como resolvi
- Criei a pasta `C:\Backups` para armazenar os arquivos.
- Alterei o banco para o modelo de recuperação FULL.
- Executei primeiro o backup completo e, em seguida, os demais backups.

## Aprendizado
Compreendi a sequência correta dos tipos de backup e a importância da verificação de integridade do banco de dados após a criação dos backups.