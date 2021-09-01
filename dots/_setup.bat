@echo off

pushd %~dp0

echo "Copy dotfiles to HOME (USERPROFILE)"

mklink %USERPROFILE%\.gitconfig %USERPROFILE%\dotfiles\dots\.gitconfig
mklink %USERPROFILE%\.gitignore %USERPROFILE%\dotfiles\dots\.gitignore
mklink %USERPROFILE%\.gitmessage.txt %USERPROFILE%\dotfiles\dots\.gitmessage.txt

popd
