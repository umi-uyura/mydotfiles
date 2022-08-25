@ECHO OFF

FOR /f "usebackq delims=" %%A IN (`powershell -command "Get-ComputerInfo -Property OsName" ^| findstr /C:"Windows"`) DO SET OSNAME=%%A
SET OSVER=%OSNAME:~18,2%
ECHO Windows version: %OSVER%

@REM Enable Long Paths
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d 1 /f

@REM Register startup script
REG ADD "HKCU\SOFTWARE\Microsoft\Command Processor" /v "AutoRun" /t REG_SZ /d "%%USERPROFILE%%\\dotfiles\\shell\\mystartup.cmd" /f

@REM Display seconds on the clock (Windows 10 only)
IF "%OSVER%" == "10" (
   REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1 /f
)
