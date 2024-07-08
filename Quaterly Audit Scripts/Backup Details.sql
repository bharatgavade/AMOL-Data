----------------Backup Details-------------------
--Note: use 'NT AUTHORITY\SYSTEM' as username for On-Prem servers
--Note: use 'NT SERVICE\AzureWLBackupPluginSvc' as username for Azure servers
SELECT
       @@Servername as [Server Name],
       cast(B.name as varchar(35)) as [Database Name], 
        ISNULL(Convert(char(40), MAX(backup_start_date), 100), 'NEVER') as [Backup Start Date],  
        ISNULL(Convert(char(40), MAX(backup_finish_date), 100), 'NEVER') as [Backup End Date] ,
        ISNULL(STR(ABS(DATEDIFF(day, GetDate(), MAX(backup_finish_date)))), 'NEVER') as [Day Since Last Backup],
        GETDATE() as [Execution Date]
FROM master.dbo.sysdatabases B LEFT OUTER JOIN msdb.dbo.backupset A ON A.database_name = B.name 
--AND A.type = 'D'  
--AND A.type = 'I'  
--AND A.type = 'L'  
--AND A.user_name='NT AUTHORITY\SYSTEM'
--AND A.user_name='NT SERVICE\AzureWLBackupPluginSvc'
where (B.name!='tempdb' and B.name!='model' and B.name!='master' and B.name!='msdb' and B.name!='DBAADMIN' and B.name!='EventNotifications')
GROUP BY B.Name ORDER BY [Day Since Last Backup] asc
-----------------------------------------------------------------------

SELECT
       'Your_IP' as [Server IP],
       @@Servername as [Server Name],
       cast(B.name as varchar(100)) as [Database Name], 
        ISNULL(Convert(char(40), MAX(backup_start_date), 100), 'NEVER') as [Backup Start Date],  
        ISNULL(Convert(char(40), MAX(backup_finish_date), 100), 'NEVER') as [Backup End Date] ,
        ISNULL(STR(ABS(DATEDIFF(day, GetDate(), MAX(backup_finish_date)))), 'NEVER') as [Day Since Last Backup],
        GETDATE() as [Execution Date]
        
FROM master.dbo.sysdatabases B LEFT OUTER JOIN msdb.dbo.backupset A 
ON A.database_name = B.name 
--AND A.type = 'D'  
--AND A.type = 'I'
--AND A.type = 'L'    
        where (B.name!='master' and B.name!='tempdb' and B.name!='model' and B.name!='msdb' and B.name!='DBAADMIN' and B.name!='EventNotifications')
        GROUP BY B.Name ORDER BY [Day Since Last Backup] asc

		--'master','tempdb','model','msdb','DBAADMIN','EventNotifications'
-------------------------------------------------

----if any doubt in above query this one

SELECT server_name,database_name,type,backup_size,compressed_backup_size,backup_start_date,backup_finish_date,
first_lsn,last_lsn,checkpoint_lsn,database_backup_lsn,* from msdb.dbo.backupset
where database_name='' and type='D' 
--and user_name='NT SERVICE\AzureWLBackupPluginSvc'		-- for Azure
--and user_name='NT AUTHORITY\SYSTEM'					-- for On-Prem
order by backup_set_id desc --AND NAME IS NOT NULL

--select backup_start_date,* from msdb.dbo.backupset order by backup_set_id desc