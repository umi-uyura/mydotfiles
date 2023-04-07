@ECHO OFF

REM winget install -s winget -e --id Google.JapaneseIME --force
winget install -s winget -e --id FastCopy.FastCopy --location "%LOCALAPPDATA%\FastCopy"
winget install -s winget -e --id Python.Python.3.11 --override PrependPath=0
