@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

WHERE gh >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    CALL:ECHO_WARN "GitHub CLI(gh) command not found, skipped check."
)

ECHO # hwtnb/SylphyHornPlusWin11
gh release list -L 2 --repo hwtnb/SylphyHornPlusWin11
ECHO.

ECHO # shapoco/calctus
gh release list --exclude-drafts --exclude-pre-releases -L 2 --repo shapoco/calctus
ECHO.

EXIT /b

:ECHO_WARN
ECHO [33m%~1[0m
EXIT /b

ENDLOCAL
