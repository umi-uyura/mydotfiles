@ECHO OFF

rem ECHO %*
CALL :%*

EXIT /b


REM
REM Load common environment variables
REM

:LOAD_COMMON_ENV
SET LOCALAPP_PROGRAMS=%LOCALAPPDATA%\Programs
EXIT /b


REM
REM Output warning message with color
REM
:ECHO_WARN
ECHO [33m%~1[0m
EXIT /b


REM
REM Check if GitHub CLI exists
REM
:EXIST_GH
WHERE gh >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    ECHO This script requires GitHub CLI (gh^)^.
    EXIT /b 1
)
EXIT /b


REM
REM Check if jq command exists
REM
:EXIST_JQ
WHERE JQ >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    ECHO This script requires jq^.
    EXIT /b 1
)
EXIT /b
