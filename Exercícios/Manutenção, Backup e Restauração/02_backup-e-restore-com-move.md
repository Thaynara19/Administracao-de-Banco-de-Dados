# 🗄️ Exercício de Fixação: Backup e Restauração com MOVE no SQL Server

> **Status:** Concluído 🟢  
> **Data de Realização:** 11 de Agosto de 2026  
> **Tecnologias:** T-SQL, Microsoft SQL Server, Visual Studio Code  
> **Tópicos:** Backup Full, Backup de Log, RESTORE FILELISTONLY, RESTORE com MOVE, DBCC CHECKDB  

---

## 📌 Questões do Desafio Prático

O objetivo deste exercício foi resolver as seguintes etapas práticas de administração de banco de dados:

1. **Etapa 1: Configuração da Base e Tabela**
   * Criar o banco de dados `DB_Producao`.
   * Alterar o modelo de recuperação da base para `FULL`.
   * Criar a tabela `Vendas` (`id`, `Produto`, `Valor`) e realizar a inserção dos dois primeiros produtos.

2. **Etapa 2: Execução de Backup Completo**
   * Gerar o Backup Completo (Full) da base `DB_Producao` salvando no caminho `'C:\Backups\DB_Producao_full.bak'`.

3. **Etapa 3: Novas Transações e Backup de Log**
   * Inserir dois novos registros na tabela `Vendas`.
   * Gerar o Backup de Log de Transações.

4. **Etapa 4: Inspeção e Restauração em Homologação**
   * Inspecionar os metadados e nomes lógicos do arquivo de backup.
   * Restaurar o arquivo de Backup Completo para criar uma nova base chamada `DB_Producao_Homolog`.
   * Mapear e redirecionar os arquivos físicos de dados (`.mdf`) e log (`.ldf`) utilizando a cláusula `MOVE` para evitar conflitos na mesma instância.

5. **Etapa 5: Validação e Saúde da Nova Base**
   * Alternar o contexto para a base `DB_Producao_Homolog` e consultar os dados da tabela `Vendas`.
   * Executar o comando `DBCC CHECKDB` na nova base para validar a integridade física e lógica.

---

## ❓ Dúvidas Surgidas Durante o Exercício

* **O que acontece com os dados gravados após o Backup Full?**  
  * *Dúvida:* Por que os itens `Tv samsung` e `JBL` não apareceram ao rodar o `SELECT` no banco de homologação?  
  * *Esclarecimento:* Como a restauração foi feita exclusivamente a partir do arquivo `.bak` (Full), o banco voltou exatamente para o estado em que estava no momento do backup completo. As inserções posteriores foram salvas no arquivo `.trn` (Log) e só seriam restauradas se o backup de log fosse aplicado em seguida.

---

## 🎯 Dificuldades Encontradas, Erros e Correções

### ⚠️ Dificuldades e Erros Iniciais
* **Conflito de Sobrescrita no Arquivo Físico MDF:** Na primeira tentativa de `RESTORE`, o caminho do arquivo de dados apontava para `C:\Backups\DB_Producao.mdf` (o mesmo arquivo usado pelo banco de produção original), gerando um erro de arquivo em uso.
* **Mapeamento de Nomes Lógicos no Log:** Houve uma confusão inicial entre o nome lógico original gravado no arquivo `.bak` (`DB_Producao_log`) e o nome da nova base de homologação (`DB_Producao_Homolog_log`).
* **Esquecimento da Troca de Contexto (`USE`):** Falta pontual do comando `USE DB_Producao_Homolog;` antes de executar a consulta e a checagem de saúde, fazendo com que os comandos fossem direcionados para o banco errado.

---

### 🛠️ Correções Aplicadas
* **Redirecionamento Físico de Dados:** Ajuste da cláusula `MOVE 'DB_Producao' TO 'C:\Backups\DB_Producao_Homolog.mdf'`, garantindo que o banco de homologação tenha seu próprio arquivo exclusivo no disco.
* **Mapeamento Preciso com `FILELISTONLY`:** Uso do `RESTORE FILELISTONLY` para confirmar que os identificadores lógicos internos eram `DB_Producao` e `DB_Producao_log`, passando-os corretamente na cláusula `MOVE`.
* **Organização dos Blocos de Execução:** Inserção explícita de `USE DB_Producao_Homolog; GO` logo após o `RESTORE` para garantir o contexto correto no `SELECT` e no `DBCC CHECKDB`.

---

## ✅ Acertos e Aprendizados Consolidados

* **Configuração de Recovery Model:** Sucesso na alteração da base para o modelo `FULL`.
* **Geração de Backups:** Domínio da sintaxe e diferenciação entre `BACKUP DATABASE` e `BACKUP LOG`.
* **Uso Obrigatório do `MOVE`:** Compreensão clara de que para criar uma cópia de banco na mesma instância é indispensável mover os arquivos físicos de dados e log.
* **Validação de Integridade:** Execução bem-sucedida do `DBCC CHECKDB` confirmando 0 erros de alocação e consistência na nova base de homologação.