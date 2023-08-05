@ECHO OFF

rem ECHO %1
CALL :%1

EXIT /b


REM
REM Load common environment variables
REM

:LOAD_COMMON_ENV
SET LOCALAPP_PROGRAMS=%LOCALAPPDATA%\Programs
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
