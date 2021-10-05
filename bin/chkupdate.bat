@echo off
setlocal

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

for /f "usebackq delims=" %%A in (`wsl -l ^| rg -E "UTF-16" "既定"`) do set WSL_DISTRO_DEFAULT=%%A
set TARGET_WSL_DISTRO=%WSL_DISTRO_DEFAULT:(既定)=%

echo.
echo ----------------------------------------------------------
echo In wsl world ...
echo Target Distribution: %TARGET_WSL_DISTRO%
echo ----------------------------------------------------------

wsl -d %TARGET_WSL_DISTRO% bash -ic "chkupdate"
