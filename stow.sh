#!/bin/bash

if [[ "$CONFIGURE_DOTFILES" != true ]]; then
    echo "Skipping dotfiles configuration"
    exit 0
fi

run_cmd git submodule init
run_cmd git submodule update

source ./stow-install.sh

# Iterate over directories, run init script, and then stow it
for f in */; do
    dir="${f/\//}"
    if [[ -x "./$dir/init.sh" ]]; then
        run_cmd ./$dir/init.sh
    fi
    run_cmd stow --ignore='^init.sh$' "$dir"
done;
