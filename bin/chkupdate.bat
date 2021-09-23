@echo off
setlocal

set TARGET_WSL_DISTRO=Ubuntu

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
echo ### Checking for apt package updates ...
echo.

wsl -d %TARGET_WSL_DISTRO% sudo apt update
wsl -d %TARGET_WSL_DISTRO% apt list --upgradable

echo.
echo ### Checking for Homebrew updates ...
echo.

wsl -d %TARGET_WSL_DISTRO% source $HOME/.profile; brew outdated

echo.
echo ### Updating asdf plugins ...
echo.

wsl -d %TARGET_WSL_DISTRO% source $HOME/.profile; asdf plugin update --all
