#!/usr/bin/env bash
# apt-install.sh

packages=(
  build-essential
  ca-certificates
  curl
  git
  graphviz
  ipcalc
  language-pack-ja
  make
  socat
  unar
  unzip
  wget
  xz-utils

# libbz2-dev
# libffi-dev
# liblzma-dev
# libncursesw5-dev
# libreadline-dev
# libsqlite3-dev
# libssl-dev
# libxml2-dev
# libxmlsec1-dev
# llvm
# tk-dev
# zlib1g-dev
)

echo "Install following packages ..."

echo

for i in "${packages[@]}"
do
  echo "- ${i}"
done

echo

read -p "Press 'y' key to continue: " input

if [ "$input" != 'Y' -a "$input" != 'y' ]; then
  echo "Cancel the installation."
  exit
fi

echo

echo apt install "${packages[@]}"
sudo apt install "${packages[@]}"
