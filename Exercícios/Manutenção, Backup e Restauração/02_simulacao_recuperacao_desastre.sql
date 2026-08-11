use master;
create database DB_Producao;

 use DB_Producao;
go

    alter database DB_Producao set recovery full ;
    go 

    create table Vendas (
        id int primary key identity(1,1),
        Produto varchar (50) not null,
        Valor decimal (10,2) not null 

    );
    go 

    insert into Vendas (Produto,Valor) values 
    ('Iphone x', 2500.00),
    ('Notebook Dell', 5000.75);
    go 

    
    backup database DB_Producao 
    to disk = 'C:\Backups\DB_Producao_full.bak'
    with init,name ='Backup completo';
    go  

     insert into Vendas (Produto,valor) values 
        ('Tv samsung', 8000),
        ('JBL', 10000);
        go  

    backup log DB_Producao
    to disk = 'C:\Backups\DB_Producao_full.trn'
    with init,name = 'Backup de Log';
    go  

        use master;
        restore filelistonly 
        from disk = 'C:\Backups\DB_Producao_full.bak';
        go

            restore database DB_Producao_Homolog
            from disk = 'C:\Backups\DB_Producao_Full.bak'
            with 
               move 'DB_Producao' to 'C:\Backups\DB_Producao_Homolog.mdf',
               move 'DB_Producao_log' to 'C:\Backups\DB_Producao_Homolog_log.ldf',
               replace;
               go  

                use DB_Producao_Homolog;
                go
                select * from vendas;
                go  
                
                dbcc checkdb ('DB_Producao_Homolog');