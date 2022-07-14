@ECHO OFF

FOR /f "tokens=*" %%z IN (%~dp0node-npm-global-common.txt) DO (
    CALL npm install --location=global %%z
)

SET LOCAL_INSTALLFILE_PATH=%USERPROFILE%\dotfiles\local\init\node-npm-global-common.txt
IF EXIST %LOCAL_INSTALLFILE_PATH% (
   ECHO.
   ECHO [42mFound local install script and will run it.[0m
   ECHO.
   FOR /f "tokens=*" %%y IN (%LOCAL_INSTALLFILE_PATH%) DO (
       CALL npm install --location=global %%y
   )
)
