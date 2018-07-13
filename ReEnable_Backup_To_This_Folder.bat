REM Get current dir
set folder=%~dp0
REM Remove tailing backslash
set folder=%folder:~0,-1%
REM Remove existing share
net share VeeamBackup /DELETE
REM Add new share with permissions for 'SYSTEM'-User
net share VeeamBackup=%folder% /GRANT:"NT AUTHORITY\SYSTEM",FULL
IF NOT %ERRORLEVEL%==0 (
	cls
	echo.
	echo Could not enable this folder for backups.
	echo Please check your permissions.
	echo.
	echo For help contact:
	echo intern.support.zpd@lhind.dlh.de
	echo.
	pause
) else (
	cls
	echo.
	echo Successfully enabled this folder for backups.
	echo.
	pause
)