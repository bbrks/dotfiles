#!/bin/bash

# install brew if not installed
if [[ ! -x $(command -v brew) ]]; then
    echo "Installing: macOS Homebrew"
    run_cmd /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    run_cmd brew analytics off
fi

if [[ "$CONFIGURE_MACOS" == true ]]; then
    source ./init-MACOS-configure.sh
fi
