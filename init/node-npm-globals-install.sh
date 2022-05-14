#!/bin/sh

cat $(dirname ${0})/node-npm-globals-common.txt | tr -d \\r | xargs npm install -g

#
# Install only on WSL
#
npm install -g surge
npm install -g tldr
