@echo off

echo.
echo ### Checking for winget updates ...
echo.

winget upgrade

echo.
echo ### Checking for Chocolatey updates ...
echo.

choco outdated --ignore-pinned

echo.
echo ### Checking for Node package updates ...
echo.

@rem ncu -g

echo.
echo ----------------------------------------------------------
echo If you want to update WSL, press any key to continue.
echo To use sudo, you need to enter the administrator password.
echo.
echo If you don't need it, press Ctrl + C to quit.
echo ----------------------------------------------------------
echo.

pause

echo.
echo ### In wsl world ...
echo.


echo.
echo ### Checking for apt package updates ...
echo.

wsl -d Ubuntu sudo apt update
wsl -d Ubuntu apt list --upgradable

echo.
echo ### Checking for Homebrew updates ...
echo.

wsl -d Ubuntu source $HOME/.profile; brew outdated
