@ECHO OFF

FOR /f "tokens=*" %%z IN (%~dp0vscode-extensions.txt) DO (
    CALL code --install-extension %%z
)
