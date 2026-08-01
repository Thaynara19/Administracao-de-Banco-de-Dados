/* Chamado :  #1060
   Usuário criado : usr_Lucas.
   banco de dados : LaboratorioDBA.
   Permissões : Somente uma Leitura na tabela de Funcionarios,
   onde está bloqueado para fazer qualquer tipo de alteração na tabela auditoria.*/

   use master 
    create login [usr_Lucas] with password = 'Audit#2026';

   use LaboratorioDBA;
    create user [usr_Lucas] for login [usr_Lucas];

        if not exists (select * from sys.database_principals where name = 'role_auditoria')
        begin

            create role [role_auditoria];

                grant select on dbo.Funcionarios to [role_auditoria];
                deny update,delete on dbo.Auditoria to [role_auditoria];
        end
            alter role [role_auditoria] add member [usr_Lucas];
            
            
