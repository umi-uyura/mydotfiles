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
> cinst init\win\pre\chocolatey-pre.config -y
```

#### Change CapsLock key to Ctrl key

```bat
> cd C:\ProgramData\chocolatey\lib\sysinternals\tools
> ctrl2cap /install
```

PC must be rebooted.


**[WIN]** Enable WSL
---------------------

See: [Install WSL | Microsoft Docs](https://docs.microsoft.com/en-us/windows/wsl/install)

```
> wsl --install
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
```

Install git, wget ,ca-certificates, and more ...

```shell
$ sudo add-apt-repository ppa:git-core/ppa      # Git (latest)
$ sudo add-apt-repository ppa:wslutilities/wslu # WSL utilities (latest)
$ sudo apt upgrade

$ init/wsl/apt-install.sh
```

Shell settings

```bash
$ dotfiles/dots/_setup.sh
```

Load .bashrc

```bash
$ source ~/.bashrc
```


**[WIN]** Install other tools
-------------------------------

```bat
> winget import -i init\win\winget-import.json --accept-package-agreements
> init\win\winget-install.bat

REM Open command prompt with administrator privileges
> winget import -i init\win\winget-import-elevated.json --accept-package-agreements
> cinst init\win\chocolatey.config -y
```

### Python tools (use Python Launcher installed with winget)

```bat
> py -m pip install -r dots\.default-python-packages
```

### Node.js (use fnm installed with Chocolatey)

```bat
> fnm ls-remote
> fnm install <version>
> init\node-npm-globals-install.bat
```

**[WSL]** Install other tools
------------------------------

### Homebrew (Linuxbrew)

See: [Homebrew on Linux — Homebrew Documentation](https://docs.brew.sh/Homebrew-on-Linux)

```shell
$ init/homebrew-install.sh
```

### asdf

See: [Getting Started | asdf](https://asdf-vm.com/guide/getting-started.html)

```shell
$ init/asdf-plugin-install.sh
```

### Node.js (use fnm installed with Homebrew)

```shell
$ fnm ls-remote
$ fnm install <version>
$ init/node-npm-globals-install.sh
```
