USE [master]
GO

/****** Object:  LinkedServer [RGIICMDB.RELIANCECAPITAL.COM,7359]    Script Date: 12/7/2020 5:22:33 PM ******/
EXEC master.dbo.sp_addlinkedserver @server = N'RGIICMDB.RELIANCECAPITAL.COM,7359', @srvproduct=N'SQL Server'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RGIICMDB.RELIANCECAPITAL.COM,7359',@useself=N'False',@locallogin=NULL,@rmtuser=N'xpas',@rmtpassword='########'

GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'RGIICMDB.RELIANCECAPITAL.COM,7359', @optname=N'remote proc transaction promotion', @optvalue=N'false'
GO


