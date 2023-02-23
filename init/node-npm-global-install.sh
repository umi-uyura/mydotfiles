#!/bin/sh

< "$(dirname "${0}")/node-npm-global-common.txt" tr -d \\r | xargs npm install --location=global

#
# Install only on WSL/Linux/macOS
#
npm install -g surge
npm install -g tldr
