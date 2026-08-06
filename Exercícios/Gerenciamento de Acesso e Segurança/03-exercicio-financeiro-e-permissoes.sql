/* 
   Chamado: #1061
   Usuário criado: usr_Renata
   Banco de dados: LaboratorioDBA
   Módulo: Financeiro
*/
use master;
    create login [usr_Renata] with password = 'Finan#2026';

use LaboratorioDBA;
    create user [usr_Renata] for login [usr_Renata];

    if not exists ( select * from sys.database_principals where name ='role_financeiro')
    begin
        create  role [role_financeiro];
        grant select,insert on dbo.Pagamentos to [role_financeiro];
        deny update,delete on dbo.Pagamentos to [role_financeiro];
    end 
alter role [role_financeiro] add member [usr_Renata];
    