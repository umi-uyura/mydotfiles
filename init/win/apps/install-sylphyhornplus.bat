@ECHO OFF
SETLOCAL

REM
REM Install SylphyHornPlus
REM https://github.com/hwtnb/SylphyHornPlusWin11
REM

CALL _install-apps-util.bat LOAD_COMMON_ENV

CALL _install-apps-util.bat EXIST_GH
IF %ERRORLEVEL% NEQ 0 (
    EXIT /b 1
)

CALL _install-apps-util.bat EXIST_JQ
IF %ERRORLEVEL% NEQ 0 (
    EXIT /b 1
)

IF EXIST "%LOCALAPP_PROGRAMS%\SylphyHornPlus" (
    CALL _install-apps-util.bat ECHO_WARN "SylphyHornPlus directory ("%LOCALAPP_PROGRAMS%\SylphyHornPlus") already exists."
    EXIT /b 2
)


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

MOVE /-Y SylphyHorn "%LOCALAPP_PROGRAMS%\SylphyHornPlus"

ECHO.
ECHO SylphyHornPlus was installed on "%LOCALAPP_PROGRAMS%\SylphyHornPlus".

START explorer.exe "%LOCALAPP_PROGRAMS%\SylphyHornPlus"

DEL %SYLPHYHORN_ASSET_NAME%
