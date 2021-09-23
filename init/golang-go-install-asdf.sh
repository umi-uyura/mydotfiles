#!/bin/sh

go install github.com/isacikgoz/tldr/cmd/tldr@latest
go install github.com/cheat/cheat/cmd/cheat@latest

asdf reshim golang
