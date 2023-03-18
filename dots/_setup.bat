@echo off

PUSHD %~dp0

ECHO "Copy dotfiles to HOME (USERPROFILE)"

MKLINK %USERPROFILE%\.wslconfig %USERPROFILE%\dotfiles\dots\win\.wslconfig
IF EXIST %USERPROFILE%\.gitconfig (
   MOVE /Y %USERPROFILE%\.gitconfig %USERPROFILE%\.gitconfig_local
)
MKLINK %USERPROFILE%\.gitconfig %USERPROFILE%\dotfiles\dots\.gitconfig
MKLINK %USERPROFILE%\.gitignore %USERPROFILE%\dotfiles\dots\.gitignore
MKLINK %USERPROFILE%\.gitmessage.txt %USERPROFILE%\dotfiles\dots\.gitmessage.txt

POPD
