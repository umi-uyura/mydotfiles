@ECHO OFF

@REM Enable Long Paths
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d 1 /f

@REM Register startup script
REG ADD "HKCU\SOFTWARE\Microsoft\Command Processor" /v "AutoRun" /t REG_SZ /d "%%USERPROFILE%%\\dotfiles\\shell\\mystartup.cmd" /f

@REM Display seconds on the clock
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1 /f
