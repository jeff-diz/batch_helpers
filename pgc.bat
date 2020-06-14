:parse
@echo off
echo Checking if VPN is running...
tasklist /FI "IMAGENAME eq vpnui.exe" 2>NUL | find /I /N "vpnui.exe">NUL
if "%ERRORLEVEL%"=="0" echo AnyConnect is running - closing...
if "%ERRORLEVEL%"=="0" taskkill /F /IM vpnui.exe /T
tasklist /FI "IMAGENAME eq vpnagent.exe" 2>NUL | find /I /N "vpnagent.exe">NUL
if "%ERRORLEVEL%"=="0" echo AnyConnect is running - closing...
if "%ERRORLEVEL%"=="0" taskkill /F /IM vpnagent.exe /T

IF "%~1"=="" call C:\code\batch_helpers\umn_vpn.bat
IF "%~1"=="-s" call C:\code\batch_helpers\umn_vpn_split.bat
call C:\code\batch_helpers\rd_pgc.bat

pause