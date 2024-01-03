@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM Temporary pip update list file
SET PIP_LIST_UPDATE_JSON=.pip-list-update.temp.json

REM If there is no update, file content is "[]\r\n".
SET PIP_LIST_UPDATE_EXISTING_SIZE=4

WHERE py >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    CALL:ECHO_WARN "py command not found, skipped check."
    EXIT /b
)

WHERE jq >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    CALL:ECHO_WARN "jq command not found, stop check."
    EXIT /b
)

WHERE csvtk >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    CALL:ECHO_WARN "csvtk command not found, stop check."
    EXIT /b
)

py -m pip list --outdated --format=json > %PIP_LIST_UPDATE_JSON%

FOR %%A IN (%PIP_LIST_UPDATE_JSON%) DO (
    SET PIP_LIST_UPDATE_SIZE=%%~zA
)

IF %PIP_LIST_UPDATE_EXISTING_SIZE% lss %PIP_LIST_UPDATE_SIZE% (
    jq -r "[\"Packages\",\"Version\",\"Latest\"], (.[] | [.name, .version, .latest_version]) | @csv" %PIP_LIST_UPDATE_JSON% | csvtk pretty
    
    FOR /f "usebackq delims=, tokens=1" %%B IN (`jq -r ".[] | [.name, .version, .latest_version] | @csv" %PIP_LIST_UPDATE_JSON%`) DO (
        SET PIPUPDATEPACKAGES=!PIPUPDATEPACKAGES! %%~B
    )
)

IF NOT "%PIPUPDATEPACKAGES%" == "" (
    ECHO.
    ECHO Command for bulk update:
    ECHO   py -m pip install -U%PIPUPDATEPACKAGES%
) ELSE (
    ECHO All python packages are up-to-date :)
)

DEL %PIP_LIST_UPDATE_JSON%

:ECHO_WARN
ECHO [33m%~1[0m
EXIT /b
