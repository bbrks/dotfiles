#!/bin/sh

if ! `which stow`; then
  echo 'GNU Stow must be installed...'
  exit 127
fi

echo 'Initialising dotfiles...'

