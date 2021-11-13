#!/bin/sh

cat $(dirname ${0})/node-npm-globals.txt | tr -d \\r | xargs npm install -g
