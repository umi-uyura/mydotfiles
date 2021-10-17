@ECHO OFF
SETLOCAL

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
ECHO ### Checking for Node package updates ...
ECHO.

WHERE ncu >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    ncu -g
) ELSE (
    CALL:ECHO_WARN "npm-check-updates(ncu) command not found, skipped check."
)

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
    ECHO:ECHO_WARN "wsl command not found, stop check."
    EXIT
)

WHERE rg >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    ECHO:ECHO_WARN "ripgrep(rg) command not found, stop check."
    EXIT
)

FOR /f "usebackq delims=" %%A IN (`wsl -l ^| rg -E "UTF-16" "既定"`) DO SET WSL_DISTRO_DEFAULT=%%A
SET TARGET_WSL_DISTRO=%WSL_DISTRO_DEFAULT:(既定)=%

ECHO.
ECHO ----------------------------------------------------------
ECHO In wsl world ... Target Distribution: %TARGET_WSL_DISTRO%
ECHO ----------------------------------------------------------

wsl -d %TARGET_WSL_DISTRO% bash -ic "chkupdate"

EXIT

:ECHO_WARN
ECHO [33m%~1[0m
EXIT /b
