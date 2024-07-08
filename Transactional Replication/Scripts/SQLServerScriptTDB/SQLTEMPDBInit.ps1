$SQLService="SQL Server (MSSQLSERVER)"
 
&nbsp;
 
$SQLAgentService="SQL Server Agent (MSSQLSERVER)"
 
&nbsp;
 
$tempfolder="D:\SQLTEMP"
 
&nbsp;
 
if (!(test-path -path $tempfolder)) { `
 
&nbsp;
 
New-Item -ItemType directory -Path $tempfolder `
 
&nbsp;
 
}
 
Start-Service $SQLService
 
Start-Service $SQLAgentService
