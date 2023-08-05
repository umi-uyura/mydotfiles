@ECHO OFF
SETLOCAL

REM
REM Install Calctus
REM https://github.com/shapoco/calctus
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


FOR /f "usebackq delims=" %%A IN (`gh release view --repo shapoco/calctus --jq "[.assets[0].url,.assets[0].name]" --json "assets"`) DO (
    SET CALCTUS_ASSETS=%%A
)

FOR /f "usebackq delims=" %%B IN (`ECHO %%CALCTUS_ASSETS%% ^| jq ".[0]"`) DO (
    SET CALCTUS_ASSET_URL=%%B
)

FOR /f "usebackq delims=" %%C IN (`ECHO %%CALCTUS_ASSETS%% ^| jq ".[1]"`) DO (
    SET CALCTUS_ASSET_NAME=%%~C
)

ECHO URL: %CALCTUS_ASSET_URL%
ECHO NAME: %CALCTUS_ASSET_NAME%

wsl wget %CALCTUS_ASSET_URL%
wsl unzip %CALCTUS_ASSET_NAME%

MOVE /-Y %CALCTUS_ASSET_NAME:~0,-4% "%LOCALAPP_PROGRAMS%\Calctus"

ECHO.
ECHO Calctus was installed on "%LOCALAPP_PROGRAMS%\Calctus".

DEL %CALCTUS_ASSET_NAME%

START %LOCALAPP_PROGRAMS%\Calctus
