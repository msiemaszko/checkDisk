If NOT exist C:\Temp (mkdir C:\Temp\)
copy /Y \\10.4.39.204\wymiana$\checkDisk\checkDisk.ps1 c:\Temp\
PowerShell -ExecutionPolicy Bypass -File C:\Temp\checkDisk.ps1
call :CheckError
	
:Exit
	del /F/Q C:\temp\checkDisk.ps1
	exit 0

:CheckError
	IF %errorlevel% NEQ 0 ( exit 1)
goto :eof


REM powershell.exe Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
REM powershell.exe C:\temp\checkDisk.ps1