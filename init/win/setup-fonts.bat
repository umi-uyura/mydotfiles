@ECHO OFF
SETLOCAL

WHERE gh >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    ECHO This script requires GitHub CLI (gh^)^.
    EXIT /b 1
)

REM
REM FontBase path
REM
SET FONTSTORE_PATH=%USERPROFILE%\FontBase
ECHO FONTSTORE PATH = %FONTSTORE_PATH%

IF NOT EXIST %FONTSTORE_PATH% (
    ECHO Requires FontBase application and folder for store font.
    ECHO See: https://fontba.se/
    EXIT /b 1
)

PUSHD %FONTSTORE_PATH%

REM
REM PlemolJP - https://github.com/yuru7/PlemolJP
REM

FOR /f "usebackq delims=" %%A IN (`gh release view -q "." --json "tagName" --repo yuru7/PlemolJP ^| jq -r ".tagName"`) DO (
    SET PLEMOLJP_VERSION=%%A
)

IF NOT EXIST PlemolJP_HS_%PLEMOLJP_VERSION%.zip (
    REM Remove old zip
    IF EXIST PlemolJP_*.zip (
       DEL PlemolJP_*.zip
    )

    gh release download --repo yuru7/PlemolJP --pattern PlemolJP_HS*.zip --skip-existing
    IF %ERRORLEVEL% NEQ 0 (
        CALL "Font download error (PlemolJP_HS)"
        EXIT /b 1
    )

    gh release download --repo yuru7/PlemolJP --pattern PlemolJP_NF*.zip --skip-existing
    IF %ERRORLEVEL% NEQ 0 (
        CALL "Font download error (PlemolJP_NF)"
        EXIT /b 1
    )

    wsl unzip -o -q "PlemolJP_*.zip"

    REM Remove old font folder
    IF EXIST PlemolJP_HS (
        RMDIR /s /q PlemolJP_HS
    )
    IF EXIST PlemolJP_NF (
        RMDIR /s /q PlemolJP_NF
    )
    IF EXIST PlemolJP_NFJ (
        RMDIR /s /q PlemolJP_NFJ
    )

    REM Deploy new font folder
    RENAME PlemolJP_HS_%PLEMOLJP_VERSION% PlemolJP_HS
    RENAME PlemolJP_NF_%PLEMOLJP_VERSION% PlemolJP_NF
    RENAME PlemolJP_NFJ_%PLEMOLJP_VERSION% PlemolJP_NFJ

    ECHO PlemolJP %PLEMOLJP_VERSION% installed.
) ELSE (
    ECHO PlemolJP is latest version.
)


REM
REM UDEV Gothic - https://github.com/yuru7/udev-gothic
REM

FOR /f "usebackq delims=" %%A IN (`gh release view -q "." --json "tagName" --repo yuru7/udev-gothic ^| jq -r ".tagName"`) DO (
    SET UDEVGOTHIC_VERSION=%%A
)

IF NOT EXIST UDEVGothic_%UDEVGOTHIC_VERSION%.zip (
    REM Remove old zip
    IF EXIST UDEVGothic_*.zip (
       DEL UDEVGothic_*.zip
    )

    gh release download --repo yuru7/udev-gothic --pattern UDEVGothic_*.zip --skip-existing
    IF %ERRORLEVEL% NEQ 0 (
        CALL "Font download error (UDEV Gothic)"
        EXIT /b 1
    )

    wsl unzip -o -q "UDEVGothic_*.zip"

    REM Remove old font folder
    IF EXIST UDEVGothic (
        RMDIR /s /q UDEVGothic
    )
    IF EXIST UDEVGothic_NF (
        RMDIR /s /q UDEVGothic_NF
    )

    REM Deploy new font folder
    RENAME UDEVGothic_%UDEVGOTHIC_VERSION% UDEVGothic
    RENAME UDEVGothic_NF_%UDEVGOTHIC_VERSION% UDEVGothic_NF

    ECHO UDEV Gothic %UDEVGOTHIC_VERSION% installed.
) ELSE (
    ECHO UDEV Gothic is latest version.
)


REM
REM IBM Plex - https://www.ibm.com/plex/
REM

FOR /f "usebackq delims=" %%A IN (`gh release view -q "." --json "tagName" --repo IBM/plex ^| jq -r ".tagName"`) DO (
    SET IBMPLEX_VERSION=%%A
)

SET IBMPLEX_FOLDER_NAME=IBMPlex_%IBMPLEX_VERSION%
SET IBMPLEX_ZIP_NAME=%IBMPLEX_FOLDER_NAME%.zip

IF NOT EXIST %IBMPLEX_ZIP_NAME% (
    REM Remove old zip
    IF EXIST IBMPlex*.zip (
        DEL IBMPlex*.zip
    )

    gh release download --repo IBM/plex --pattern TrueType.zip --skip-existing
    IF %ERRORLEVEL% NEQ 0 (
        CALL "Font download error (IBM Plex)"
        EXIT /b 1
    )

    MOVE TrueType.zip %IBMPLEX_ZIP_NAME%

    wsl unzip -o -q %IBMPLEX_ZIP_NAME%^
        TrueType/IBM-Plex-Mono/* TrueType/IBM-Plex-Sans/* TrueType/IBM-Plex-Serif/* TrueType/IBM-Plex-Sans-JP/*^
        -d %IBMPLEX_FOLDER_NAME%

    REM Remove old font folder
    IF EXIST IBMPlex (
        RMDIR /s /q IBMPlex
    )

    REM Deploy new font folder
    RENAME %IBMPLEX_FOLDER_NAME% IBMPlex

    ECHO IBM Plex %IBMPLEX_VERSION% installed.
) ELSE (
    ECHO IBM Plex is latest version.
)


REM
REM JetBrains Mono - https://www.jetbrains.com/ja-jp/lp/mono/
REM

FOR /f "usebackq delims=" %%A IN (`gh release view -q "." --json "tagName" --repo JetBrains/JetBrainsMono ^| jq -r ".tagName"`) DO (
    SET JBM_VERSION=%%A
)

REM Remove prefix "v"
SET JBM_VERSION=%JBM_VERSION:~1%
SET JBM_FOLDER_NAME=JetBrainsMono-%JBM_VERSION%

IF NOT EXIST JetBrainsMono-%JBM_VERSION%.zip (
    REM Remove old zip
    IF EXIST JetBrainsMono-*.zip (
        DEL JetBrainsMono-*.zip
    )

    gh release download --repo JetBrains/JetBrainsMono --pattern JetBrainsMono-*.zip --skip-existing
    IF %ERRORLEVEL% NEQ 0 (
        CALL "Font download error (JetBrains Mono)"
        EXIT /b 1
    )

    wsl unzip -o -q "JetBrainsMono-*.zip" fonts/variable/* -d %JBM_FOLDER_NAME%

    REM Remove old font folder
    IF EXIST JetBrainsMono (
        RMDIR /s /q JetBrainsMono
    )

    REM Deploy new font folder
    RENAME %JBM_FOLDER_NAME% JetBrainsMono

    ECHO JetBrains Mono %JBM_VERSION% installed.
) ELSE (
    ECHO JetBrains Mono is latest version.
)


POPD
