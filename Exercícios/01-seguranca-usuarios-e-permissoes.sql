Use master ;
    create login [usr_Mariana] with password = 'Auporte#2026';
    create user [usr_Mariana] for login [usr_Mariana];

        if not exists (select*from sys.database_principals where name = 'role_suporte')
        begin  
            create role [role_suporte];
                grant select on dbo.Funcionarios to [role_suporte];
                end
        alter role [role_suporte] add member [usr_Mariana];