--Create database Treino;

    /*create table Clientes(
        id int primary key identity(1,1),
        nome varchar (100) not null
    );

    insert into Clientes (nome) values 
    ('Daniel'),
    ('Rebeca'),
    ('Andrade');*/

    use Treino;
    go

    alter database  Treino set recovery FULL;
    go

    backup database Treino
    to disk = 'C:\Backups\Exercícios_full.bak'
    with init,name = 'Backup completo do banco de dados ';
    go  

    backup database Treino
    to disk = 'C:\Backups\Exercícios_diff.bak'
    with differential,init, name = 'Banco de dados transição';
    go  

    backup log Treino
    to disk = 'C:\Backups\Exercícios_log.trn'
    with init,name = 'Backup de log';
    go  
    
    dbcc checktable ('dbo.Clientes');
    go  

    dbcc checkdb ('Treino');
    go

    USE master;
    restore database Treino
    from disk = 'C:\Backups\Exercícios_full.bak'
    with replace;
    go

    