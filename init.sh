#!/bin/sh

stow --version >/dev/null 2>&1
if [ $? -gt 0 ]
then
  echo 'GNU Stow must be installed...'
  exit 127
fi

echo 'Updating submodules...'

git submodule init
git submodule update

for f in */; do
    srv=$(echo "$f" | sed 's/.$//') 
    echo "Initialising $srv"
    ./$srv.sh
done;

