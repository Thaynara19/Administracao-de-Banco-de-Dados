/*use LaboratorioDba;
go

    create schema RH;
    go

    alter schema RH transfer dbo.Funcionarios;
    go  

    grant select,insert on schema :: RH to [role_financeiro];
    deny update,delete on schema :: RH to [role_financeiro];*/

    use LaboratorioDBA;
    go  

    create schema Finan;
    go 

    create schema Audit;
    go  

    alter schema Finan transfer dbo.Financeiro ;
    alter schema Finan transfer dbo.Pagamentos;
    alter schema Audit transfer dbo.Auditoria;
    go   

    grant select,insert on schema :: Finan to [role_financeiro];
    deny update,delete on schema :: Finan to [role_financeiro];
    go  

    grant select,insert on schema :: Audit to [role_auditoria];
    deny update,delete on schema :: Audit to [role_auditoria];
    go

