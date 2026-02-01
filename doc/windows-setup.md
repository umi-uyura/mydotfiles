Setup routine
=============

**[WIN]** Initial setup
-----------------------

* Windows Update
* Microsoft Store update

### To create account with Microsoft account

* See [Application settings](windows-apps-setting.md) and setup following applications
  * OneDrive


**[WIN]** Setup SSH & GitHub
-----------------------------

### Start OpenSSH service

* Run `services.msc`
* Open `OpenSSH Authentication Agent` property
* Change startup type to `Auto` and apply

### Generate ssh key and add GitHub account

```bat
> mkdir .ssh
> ssh-keygen -t ed25519 -C "my_email@example.com" -f .ssh/id_xxxxx
> clip < .ssh¥id_xxxxx.pub
```

Add the copied ssh key to [SSH and GPG keys page](https://github.com/settings/keys) of your github account.

### Start OpenSSH service and access GitHub

Create $USERPROFILE/.ssh/config

```
Host github.com
  HostName github.com
  IdentityFile ~/.ssh/id_xxxxx
  IdentitiesOnly yes
  AddKeysToAgent yes
```

Start OpenSSH service

```bat
> ssh-agent -s
> ssh-add .ssh¥id_xxxxx
> ssh -T git@github.com
Hi <user>! You've successfully authenticated, bu Github does not provide shell access.
```


**[WIN]** Install Git & clone dotfiles repository
--------------------------------------------------

### Install basic applications

Download [init/win/pre/winget-import-pre.json](../init/win/pre/winget-import-pre.json) (Easy to save to right-click on raw file link)


```bat
> winget import -i winget-import-pre.json --accept-package-agreements
```

For Windows 10, Download [winget-import-msstore-pre-win10.json](../init/win/pre/winget-import-msstore-pre-win10.json)

```bat
> winget import -i winget-import-msstore-pre-win10.json --accept-package-agreements
```

### Install Chocolatey

Open PowerShell with administrator privileges.

[Install Chocolatey](https://chocolatey.org/install#individual)


### Clone dotfiles repository

Set git config

```
> git config --global user.name "<name>"
> git config --global user.email "<mail>"
```

Clone repository

```bat
> git clone <dotfiles repository> dotfiles
```

### Minimum Windows settings

Open command prompt with administrator privileges.

```bat
REM Register settings to registry
> init\win\reg-add.bat

REM Create symbolic link for dotfiles
> dots\_setup.bat
```
### Install minimum tools for build environment

Open command prompt with administrator privileges.

```bat
> choco install init\win\pre\chocolatey-pre.config -y
```

#### Change CapsLock key to Ctrl key

Open command prompt with administrator privileges.

```bat
> cd C:\ProgramData\chocolatey\lib\sysinternals\tools
> ctrl2cap /install
```

PC must be rebooted.


**[WIN]** Enable WSL
---------------------

See: [Install WSL | Microsoft Docs](https://docs.microsoft.com/en-us/windows/wsl/install)

Open command prompt with administrator privileges.

```
> wsl --install
```

PC must be rebooted.

```
> wsl --install
```

After rebooting the PC, perform the initial setup of WSL Linux.

```shell
Enter new UNIX username: xxxx
New password: xxxx
```

Update packages.

```shell
$ sudo apt update && sudo apt upgrade
```


**[WSL]** Link dotfiles and setup
---------------------------------

Add following variables to environment variables (See [windows-settings.md](windows-settings.md)) 

* `WSLENV`
* `DOTFILES_ROOT`

Synbolic link to host dotfiles folder.

```shell
$ ln -s $USERPROFILE/dotfiles dotfiles

# Revert line break that were changed when cloned on Windows side
$ cd dotfiles
$ git reset --hard

$ sudo cp dots/wsl/etc/wsl.conf /etc/
```

```bat
> wsl --shutdown
```

Install git, wget ,ca-certificates, and more ...

```shell
$ init/wsl/apt-install.sh
```

Shell settings

```shell
$ dotfiles/dots/_setup.sh
```

Load .bashrc

```shell
$ source ~/.bashrc
```

Create $HOME/.ssh/config

```
Host github.com
  HostName github.com
  IdentityFile ${USERPROFILE}/.ssh/id_xxxxx
  IdentitiesOnly yes
  AddKeysToAgent yes
```

Restart WSL in Windows

```
> wsl --shutdown
```

ssh setting

```shell
$ ssh -T git@github.com

# If UNPROTECTED PRIVATE KEY FILE! occurs
$ chmod 600 $USERPROFILE/.ssh/id_xxxxx
```


**[WIN]** Install other tools
-------------------------------

```bat
> winget import -i init\win\winget-import.json --accept-package-agreements
> init\win\winget-install.bat
> (init\win\apps\*.bat)

REM Open command prompt with administrator privileges
> winget import -i init\win\winget-import-elevated.json --accept-package-agreements
> choco install init\win\chocolatey.config -y
```

Install fonts

```
> init\win\setup-font.bat
```


**[WSL]** Setup Homebrew (Linuxbrew)
------------------------------------

See: [Homebrew on Linux — Homebrew Documentation](https://docs.brew.sh/Homebrew-on-Linux)

```shell
$ brew doctor
$ brew bundle --file=init/Brewfile
```


**[WSL]** Setup font
--------------------

Reference fonts on the Windows side from within WSL

```
$ sudo cp dots/wsl/etc/fonts/local.conf
```


**[WIN]** Setup various languages and runtimes
-----------------------------------------------

### Python tools (use Python Launcher installed with winget)

```bat
> py -m pip install -r dots\.default-python-packages
```

### Node.js (use fnm installed with winget)

```bat
> fnm ls-remote
> fnm install <version>
> init\node-npm-globals-install.bat
```


**[WSL]** Setup various languages and runtimes
----------------------------------------------

### Python/Go (use mise installed with Homebrew)

See: [Getting Started | mise-en-place](https://mise.jdx.dev/getting-started.html#installing-mise-cli)

```shell
# Python
$ mise ls-remote python
$ mise install python@x.xx
$ mise use -g python@x.xx

# Go
$ mise ls-remote go
$ mise install go@x.xx
$ mise use -g go@x.xx
```

### Node.js (use fnm installed with Homebrew)

```shell
$ fnm ls-remote
$ fnm install <version>
$ init/node-npm-globals-install.sh
```

### Heroku CLI

See: [The Heroku CLI | Heroku Dev Center](https://devcenter.heroku.com/articles/heroku-cli#install-with-ubuntu-debian-apt-get) - Install with Ubuntu / Debian apt-get

```shell
$ curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
```


**[WIN]** Replace old OpenSSH
-----------------------------

OpenSSH 8.6 (Windows 11 pre-installed) and Ubuntu 22.04 (OpenSSH 8.9) are version mismatch.

Uninstall OpenSSH Client and OpenSSH

```
> winget install --id Microsoft.OpenSSH.Beta
```

Disable and stop OpenSSH SSH Server


**[WSL]** Setup Mozc for Japanese input method
----------------------------------------------

```shell
$ im-config -l          # Check that fcitx5 exists
$ im-config -n fcitx5
```

Reboot wsl

```cmd
wsl --shutdown
```

Run `fcitx5-configtool` and set the following

- 入力メソッド
  - Mozc以外を削除
  - システムのキーボードレイアウト
    - レイアウト: `日本語`
- グローバルオプション
  - 入力メソッドの切り替え
    - `全角半角`
  - 一時的に第1入力メソッドに切り替える: `空`
  - 入力メソッドを有効にする: `変換`
  - 入力メソッドをオフにする: `無変換`
