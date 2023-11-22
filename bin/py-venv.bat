@ECHO OFF

WHERE py >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    ECHO "Error: Python not found."
    EXIT /b
)

SET VENV_PATH="%CD%\.venv"
ECHO VENV PATH: %VENV_PATH%

FOR /f "usebackq delims=" %%A IN (`py --version`) DO (
    SET PYTHON_VERSION=%%A
)

IF EXIST %VENV_PATH% (
   %VENV_PATH%\Scripts\activate.bat
) else (
   ECHO Virtual Python environments not found. Create it ?
   ECHO Current Python version: %PYTHON_VERSION%
   ECHO.
   ECHO ***WARNING*** If you don't need it, press Ctrl + C to quit.

   PAUSE

   py -m venv --upgrade-deps .venv
)
