dotfiles for Windows/WSL
========================

My dotfiles for Windows and WSL.

Folder structure
----------------



Installation routine
--------------------

### Clone dotfiles repository

### Install minimum tools for build environment

```cmd
> init\win\pre\winget-pre.bat

# Open command prompt with administrator privileges
> cinst init\win\pre\chocolatey-pre.config -y
```

### **[WIN]** hoge

Change CapsLock key to Ctrl key.

https://docs.microsoft.com/en-us/sysinternals/downloads/ctrl2cap

```cmd
> where ctrl2cap
C:\ProgramData\chocolatey\bin\ctrl2cap.exe

> ctrl2cap /install
Ctrl2cap Installation Applet
Copyright (C) 1999-2006 Mark Russinovich
Sysinternals - www.sysinternals.com

Could not copy ctrl2cap.nt5.sys to \system32\drivers.:
指定されたファイルが見つかりません。

> cd C:\ProgramData\chocolatey\lib\sysinternals\tools

Ctrl2cap Installation Applet
Copyright (C) 1999-2006 Mark Russinovich
Sysinternals - www.sysinternals.com

Ctrl2cap successfully installed. You must reboot for it to take effect.
```

### **[WIN]** Enable WSL

https://docs.microsoft.com/ja-jp/windows/wsl/install-win10


### **[WSL]** fuga

Synbolic link to host dotfiles folder.

```shell
$ ln -s $USERPROFILE/dotfiles dotfiles
```

```shell
$ sudo apt update && sudo apt upgrade
```

Install git, wget ,ca-certificates

```shell
# for Git (latest)
sudo add-apt-repository ppa:git-core/ppa
sudo apt upgrade
sudo apt install git

# for Visual Studio Code
sudo apt install wget ca-certificates
```


### **[WIN]** Install other tools

```cmd
> init\win\winget-install.bat

# Open command prompt with administrator privileges
> cinst init\win\chocolatey.config -y
```

### **[WSL]** asdf ?

最新のバージョンについては公式サイトを参照

https://asdf-vm.com/guide/getting-started.html

```shell
$ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
```
