@ECHO OFF
SETLOCAL

WHERE gh >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    ECHO This script requires GitHub CLI (gh^)^.
    EXIT /b 1
)

@REM FontBase path
SET FONTBASE_PATH=%USERPROFILE%\FontBase
FOR /f "usebackq delims=" %%A IN (`wsl wslpath -u "%FONTBASE_PATH%"`) DO SET FONTBASE_UPATH=%%A

ECHO FONTBASE_PATH = %FONTBASE_PATH%
ECHO FONTBASE_UPATH = %FONTBASE_UPATH%

@REM PlemolJP

gh release download --repo yuru7/PlemolJP --pattern PlemolJP_HS*.zip
IF %ERRORLEVEL% NEQ 0 (
    CALL "Font download error (PlemolJP)"
    EXIT /b 1
)

MOVE PlemolJP_HS* %FONTBASE_PATH%
wsl unzip %FONTBASE_UPATH%/PlemolJP_HS*.zip -d %FONTBASE_UPATH%

@REM IBM Plex

gh release download --repo IBM/plex --pattern TrueType.zip 
IF %ERRORLEVEL% NEQ 0 (
    CALL "Font download error (IBM Plex)"
    EXIT /b 1
)

MOVE TrueType.zip %FONTBASE_PATH%\\IBMPlex.zip
wsl unzip %FONTBASE_UPATH%/IBMPlex.zip^
    TrueType/IBM-Plex-Mono/* TrueType/IBM-Plex-Sans/* TrueType/IBM-Plex-Serif/* TrueType/IBM-Plex-Sans-JP/*^
    -d %FONTBASE_UPATH%
MOVE %FONTBASE_PATH%\\TrueType %FONTBASE_PATH%\\IBMPlexTrueType

@REM JetBrains Mono

gh release download --repo JetBrains/JetBrainsMono --pattern JetBrainsMono-*.zip
IF %ERRORLEVEL% NEQ 0 (
    CALL "Font download error (JetBrains Mono)"
    EXIT /b 1
)

MOVE JetBrainsMono-* %FONTBASE_PATH%
wsl unzip %FONTBASE_UPATH%/JetBrainsMono-*.zip fonts/variable/* -d %FONTBASE_UPATH%
MOVE %FONTBASE_PATH%\\fonts %FONTBASE_PATH%\\JetBrainsMono
