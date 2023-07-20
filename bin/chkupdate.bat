@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

ECHO.
ECHO ### Checking for winget updates ...
ECHO.

WHERE winget >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    winget upgrade
) ELSE (
    CALL:ECHO_WARN "winget command not found, skipped check."
)


ECHO.
ECHO ### Checking for Chocolatey updates ...
ECHO.

WHERE choco >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    choco outdated --ignore-pinned
) ELSE (
    CALL:ECHO_WARN "choco command not found, skipped check."
)


ECHO.
ECHO ### Checking for Go package updates ...
ECHO.

WHERE gup >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    gup check
) ELSE (
    CALL:ECHO_WARN "gup command not found, skipped check."
)


ECHO.
ECHO ### Checking for Python package updates ...
ECHO.

WHERE py >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    CALL py -m pip list --outdated
    FOR /f "usebackq delims=" %%A IN (`py -m pip list --outdated --format json ^| jq -r ".[].name"`) DO (
        SET PIPRESULT=!PIPRESULT!%%A 
    )

    IF NOT "!PIPRESULT!" == "" (
       ECHO.
       ECHO Command for bulk update:
       ECHO   py -m pip install -U !PIPRESULT!
    ) ELSE (
       ECHO All global python packages are up-to-date :^)
       ECHO.
    )
) ELSE (
    CALL:ECHO_WARN "Python launcher(py) command not found, skipped check."
)

ECHO.
ECHO ### Checking for Node package updates ...
ECHO.

WHERE ncu >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    CALL ncu -g
) ELSE (
    CALL:ECHO_WARN "npm-check-updates(ncu) command not found, skipped check."
)


ECHO.
ECHO ### Checking for GitHub CLI extensions updates ...
ECHO.

WHERE gh >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    gh extension upgrade --all --dry-run
) ELSE (
    CALL:ECHO_WARN "GitHub CLI(gh) command not found, skipped check."
)


ECHO.
ECHO ### Checking other tools ...
ECHO.

CALL chkupdate-tools


ECHO.
ECHO ----------------------------------------------------------
ECHO If you want to update WSL, press any key to continue.
ECHO To use sudo, you need to enter the administrator password.
ECHO.
ECHO If you don't need it, press Ctrl + C to quit.
ECHO ----------------------------------------------------------
ECHO.

PAUSE

WHERE wsl >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    CALL:ECHO_WARN "wsl command not found, stop check."
    EXIT /b
)

FOR /f "usebackq delims=" %%A IN (`wsl echo $WSL_DISTRO_NAME`) DO SET WSL_DISTRO_DEFAULT=%%A
SET TARGET_WSL_DISTRO=%WSL_DISTRO_DEFAULT:(既定)=%

ECHO.
ECHO ----------------------------------------------------------
ECHO In wsl world ... Target Distribution: %TARGET_WSL_DISTRO%
ECHO ----------------------------------------------------------

wsl -d %TARGET_WSL_DISTRO% bash -ic "chkupdate"

EXIT /b

:ECHO_WARN
ECHO [33m%~1[0m
EXIT /b

ENDLOCAL
