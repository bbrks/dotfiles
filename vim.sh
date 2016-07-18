#!/bin/sh

mkdir -p vim/.vim/autoload
mkdir -p vim/.vim/bundle

curl -LSso vim/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

stow vim

