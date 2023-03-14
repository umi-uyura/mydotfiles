Setup routine
=============

**[WIN]** Initial setup
-----------------------

### To create account with Microsoft account

* See [Application settings](windows-apps-setting.md) and setup following applications
  * OneDrive


**[WIN]** Setup SSH & GitHub
-----------------------------

```bat
> ssh-keygen -t ed25519 -C "my_email@example.com" -f ~/.ssh/id_xxxxx
> clip < ~/.ssh/id_xxxxx.pub
```

Add the copied ssh key to [SSH and GPG keys page](https://github.com/settings/keys) of your github account.


**[WIN]** Install Git & clone dotfiles repository
--------------------------------------------------

### Install basic applications

```bat
> cd init\win\pre
> winget import -i winget-import-pre.json --accept-package-agreements
```

For Windows 10, add following steps.

```bat
> cd init\win\pre
> winget import -i winget-import-msstore-pre-win10.json --accept-package-agreements
```

### Clone dotfiles repository

```bat
> git clone <dotfiles repository>
```

### Minimum Windows settings

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


**[WSL]** Link dotfiles and setup
---------------------------------

Synbolic link to host dotfiles folder.

```shell
$ ln -s $USERPROFILE/dotfiles dotfiles
```

Update packages.

```shell
$ sudo apt update && sudo apt upgrade
```

Install git, wget ,ca-certificates, and more ...

```shell
$ sudo add-apt-repository ppa:git-core/ppa      # Git (latest)
$ sudo add-apt-repository ppa:wslutilities/wslu # WSL utilities (latest)
$ sudo apt upgrade

$ init/wsl/apt-install.sh
```


**[WIN]** Install other tools
-------------------------------

```bat
> init\win\winget-install.bat

REM Open command prompt with administrator privileges
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
