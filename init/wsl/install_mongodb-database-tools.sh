#!/usr/bin/env bash
# install_mongodb-database-tools.sh
#
# - Get `MONGODBTOOLS_URL` from following url:
#   https://www.mongodb.com/try/download/database-tools
#

set -eu

MONGODBTOOLS_URL="https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-x86_64-100.7.0.deb"
MONGODBTOOLS_FILENAME=$(basename $MONGODBTOOLS_URL)

echo "Download mongodb-database-tools package ..."
echo

curl "$MONGODBTOOLS_URL" -o "$MONGODBTOOLS_FILENAME"

echo
echo "Install mongodb-database-tools package ..."

read -r -p "Press 'y' key to continue: " input

if [ "$input" != 'Y' ] && [ "$input" != 'y' ]; then
  echo "Cancel the installation."
  exit
fi

echo

echo Run \"apt-get install "$MONGODBTOOLS_FILENAME"\"
sudo apt-get install "./$MONGODBTOOLS_FILENAME"

rm -i "$MONGODBTOOLS_FILENAME"
