@ECHO OFF
@REM Command prompt startup script

IF "%MYSTARTUP_INIT%"=="OK" (
    EXIT /b
)

ECHO ... Running startup script
SET MYSTARTUP_INIT=OK

@REM Setup fnm
FOR /f "tokens=*" %%z IN ('fnm env --use-on-cd') DO CALL %%z

@REM Startup completion
SET MYSTARTUP_COMPLETE=OK

ECHO ... Complete startup script
