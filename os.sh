#!/bin/bash

OS=""
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="MACOS"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ -x $(command -v pacman) ]]; then
        OS="ARCH"
    else
        echo "Unsupported Linux distro"
        exit 127
    fi
else
    echo "Unsupported OS: $OSTYPE"
    exit 127
fi
