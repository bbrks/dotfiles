#!/bin/bash

# Abort on error
set -e
set -o pipefail

source ./utils.sh
source ./os.sh
source ./config.sh
source ./init-$OS.sh
source ./apps.sh
source ./stow.sh
