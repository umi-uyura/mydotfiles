@ECHO OFF

FOR /f "tokens=*" %%z IN (%~dp0node-npm-globals.txt) DO npm install -g %%z
