macOS Setup routine
====================

Last checked OS: macOS Big Sur


Change login shell from zsh to bash
------------------------------------

```zsh
% chsh -s /bin/bash
% exit
```

### Use Homebrew bash

Add Homebrew bash path to `/etc/shells` and execute `chsh -s /usr/local/bin/bash`

```
$ cat /etc/shells
# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash
/bin/csh
/bin/dash
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
/usr/local/bin/bash         # <-- add
```


Provisioning
------------

```bash
$ sudo softwareupdate -i -a     # Run software update
$ xcode-select --install        # Install command line tools
$ sudo shutdown -r now          # To run when you are requested
```


Setup SSH & GitHub
------------------

Set git config

```
$ git config --global user.name "<name>"
$ git config --global user.email "<mail>"
```

Generate ssh key pair

```bash
$ ssh-keygen -t ed25519 -C "my_email@example.com" -f ~/.ssh/id_xxxxx
$ pbcopy < ~/.ssh/id_xxxxx.pub
```

Add the copied ssh key to [SSH and GPG keys page](https://github.com/settings/keys) of your github account.

Edit ssh config

```bash
$ vi ~/.ssh/config
```

~/.ssh/config

```
Host github.com
  HostName github.com
  IdentityFile ~/.ssh/id_xxxxx
  IdentitiesOnly yes
  AddKeysToAgent yes
  UseKeychain yes
```

Authenticate to github.com

```bash
$ eval "$(ssh-agent -s)"
$ ssh-add --apple-use-keychain ~/.ssh/id_xxxxx
$ ssh -T git@github.com
Hi <user>! You've successfully authenticated, bu Github does not provide shell access.
```

Setup dotfiles
--------------

Get repository

```bash
$ git clone git@github.com:umi-uyura/mydotfiles.git dotfiles
$ git clone git@github.com:umi-uyura/mydotemacs.git .emacs.d
$ cd dotfiles
$ ./init/macos/set-computername.sh
$ exit
```

Shell settings

```bash
$ dotfiles/dots/_setup.sh
$ vi ~/.bashrc
```

.bashrc

```
if [ -f $HOME/.bashrc_basis ]; then
  . $HOME/.bashrc_basis
fi
```

Load .bashrc

```bash
$ source ~/.bashrc
```


OS X setting
------------

```bash
$ dotfiles/init/macos/osx-defaults.sh
```


Install applications
--------------------

Install Homebrew

Latest routine: see https://brew.sh/

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Setup Homebrew Bundle
$ brew bundle --file=~/dotfiles/init/Brewfile
$ brew bundle --file=~/dotfiles/init/macos/Brewfile
$ brew bundle --file=~/dotfiles/init/macos/BrewCaskfile
$ brew bundle --file=~/dotfiles/init/macos/BrewCaskOptionfile   # As necessary
$ brew bundle --file=~/dotfiles/init/macos/BrewMasfile          # Must be sign in to MAS
```


Install other tools
-------------------

### asdf

See: [Getting Started | asdf](https://asdf-vm.com/guide/getting-started.html)

```shell
$ init/asdf-plugin-install.sh

# Python
$ asdf list all python | grep ^3
$ asdf install python <version>
$ asdf reshim python

# Go
$ asdf list all golang
$ asdf install golang <version>
$ asdf reshim golang
```

### Node.js (use fnm installed with Homebrew)

```shell
$ fnm ls-remote
$ fnm install <version>
$ node --version > .node-version
$ init/node-npm-globals-install.sh
```
