#!/usr/bin/env bash
# apt-install.sh

set -eu

sudo add-apt-repository ppa:git-core/ppa                # Git (latest)
sudo add-apt-repository ppa:wslutilities/wslu           # WSL utilities (latest)
sudo add-apt-repository ppa:ubuntuhandbook1/emacs       # Emacs

sudo apt update

packages=(
  build-essential
  ca-certificates
  cmigemo
  curl
  git
  graphviz
  ipcalc
  language-pack-ja
  make
  pwgen
  socat
  traceroute
  tree
  unar
  unzip
  wget
  whois
  wslu
  x11-apps
  # x11-xserver-utils     # xmodmap
  xz-utils

  emacs
  emacs-common
  emacs-mozc-bin
  mozc-utils-gui

  libbz2-dev
  libffi-dev
  liblzma-dev
  libncursesw5-dev
  libreadline-dev
  libsqlite3-dev
  libssl-dev
  libxml2-dev
  libxmlsec1-dev
  llvm
  tk-dev
  zlib1g-dev
)

echo "Install following packages ..."
echo

for i in "${packages[@]}"
do
  echo "- ${i}"
done

echo

read -r -p "Press 'y' key to continue: " input

if [ "$input" != 'Y' ] && [ "$input" != 'y' ]; then
  echo "Cancel the installation."
  exit
fi

echo

echo apt-get install "${packages[@]}"
sudo apt-get install "${packages[@]}"
