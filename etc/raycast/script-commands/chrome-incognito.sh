#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open url in Chrome incognito mode
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🕶️
# @raycast.argument1 { "type": "text", "placeholder": "localhost", "optional": true }
# @raycast.argument2 { "type": "text", "placeholder": "80", "optional": true }
# @raycast.argument3 { "type": "text", "placeholder": "/", "optional": true }
# @raycast.packageName 

# Documentation:
# @raycast.author Umi Uyura

URL=$1
PORT=$2
SUBDIR=$3

if [ "$URL" == "" ] || [ "$URL" == "localhost" ];then
    URL="http://localhost"
elif [[ ! "$URL" == *http* && ! "$URL" == *https* ]]; then
    URL="https://$URL"
fi

if [ "$PORT" == "80" ];then
    PORT=""
elif [ ! "$PORT" == "" ];then
    PORT=":$PORT"
fi

if [ "$SUBDIR" == "" ];then
    SUBDIR="/"
fi

open -a "Google Chrome" -n --args --incognito "$URL$PORT$SUBDIR"
