@ECHO OFF

FOR /f "tokens=*" %%z IN (%~dp0node-npm-globals-common.txt) DO npm install --location=global %%z
