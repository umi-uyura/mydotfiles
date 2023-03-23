@ECHO OFF
SETLOCAL

WHERE gh >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    ECHO This script requires GitHub CLI (gh^)^.
    EXIT /b 1
)

REM
REM SylphyHornPlus - https://github.com/hwtnb/SylphyHornPlusWin11
REM

FOR /f "usebackq delims=" %%A IN (`gh api repos/hwtnb/SylphyHornPlusWin11/releases ^| jq -c ".[0].assets[] | [.browser_download_url,.name]"`) DO (
    SET SYLPHYHORN_ASSET=%%A
)

FOR /f "usebackq delims=" %%B IN (`ECHO %%SYLPHYHORN_ASSET%% ^| jq ".[0]"`) DO (
    SET SYLPHYHORN_ASSET_URL=%%B
)

FOR /f "usebackq delims=" %%C IN (`ECHO %%SYLPHYHORN_ASSET%% ^| jq ".[1]"`) DO (
    SET SYLPHYHORN_ASSET_NAME=%%C
)

ECHO URL: %SYLPHYHORN_ASSET_URL%
ECHO NAME: %SYLPHYHORN_ASSET_NAME%

wsl wget %SYLPHYHORN_ASSET_URL%
wsl unzip %SYLPHYHORN_ASSET_NAME%

MOVE /-Y SylphyHorn %LOCALAPPDATA%\Programs\SylphyHornPlus

START %LOCALAPPDATA%\Programs\SylphyHornPlus

DEL %SYLPHYHORN_ASSET_NAME%
