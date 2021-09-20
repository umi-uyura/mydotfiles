@echo off

echo Search keyword: %1

echo.
echo ### Searching from winget ...
echo.

winget search %1

echo.
echo ### Searching from Chocolatey ...
echo.

choco search %1
