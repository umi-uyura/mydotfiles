#!/bin/sh

#
# Refer:
#   dots/.default-golang-pkgs
#

# go install github.com/isacikgoz/tldr/cmd/tldr@latest  # Trying the Node.js version
go install github.com/cheat/cheat/cmd/cheat@latest
go install github.com/tomnomnom/gron@latest

asdf reshim golang
