#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open localhost in Chrome incognito mode
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🕶️
# @raycast.argument1 { "type": "text", "placeholder": "80", "optional": true }
# @raycast.argument2 { "type": "text", "placeholder": "/", "optional": true }
# @raycast.packageName 

# Documentation:
# @raycast.author Umi Uyura

PORT=$1
SUBDIR=$2

if [ "$PORT" == "80" ];then
    PORT=""
elif [ ! "$PORT" == "" ];then
    PORT=":$PORT"
fi

if [ "$SUBDIR" == "" ];then
    SUBDIR="/"
fi

open -a "Google Chrome" -n --args --incognito "http://localhost$PORT/$SUBDIR"
