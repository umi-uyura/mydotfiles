@echo off

echo.
echo Checking for winget updates ...
echo.

winget upgrade

echo.
echo Checking for Chocolatey updates ...
echo.

choco outdated --ignore-pinned

echo.
echo Checking for Node package updates ...
echo.

@rem ncu -g

echo.
echo If you want to update WSL, press any key to continue . . .
echo.

pause

::wsl myupdate
