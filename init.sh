#!/bin/sh

stow --version >/dev/null 2>&1
if [ $? -gt 0 ]
then
  echo 'GNU Stow must be installed...'
  exit 127
fi

echo 'Initialising dotfiles...'

