@ECHO OFF
@REM Command prompt startup script

SET MYSTARTUP_DEBUG=OFF

IF "%MYSTARTUP_INIT%"=="OK" (
    EXIT /b
)

CALL:MYSTARTUP_DEBUG_ECHO "... Running startup script"
SET MYSTARTUP_INIT=OK

@REM Register doskey macros
doskey /macrofile=%USERPROFILE%\dotfiles\shell\doskey-alias.macros

@REM Setup fnm
WHERE fnm >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    FOR /f "tokens=*" %%z IN ('fnm env --use-on-cd') DO CALL %%z
)

@REM Startup completion
SET MYSTARTUP_COMPLETE=OK

CALL:MYSTARTUP_DEBUG_ECHO "... Complete startup script"


:MYSTARTUP_DEBUG_ECHO
IF "%MYSTARTUP_DEBUG%"=="ON" (
    ECHO %~1
)
