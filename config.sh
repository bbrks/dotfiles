#!/bin/bash

echo ""
echo "=========================="
echo "===== Configuration ======"
echo "=========================="

DRYRUN=$(askDefaultY Dry run?)

VERBOSE=false
if [[ "$DRYRUN" == false ]]; then
    VERBOSE=$(askDefaultY Verbose?)
fi

INSTALL_CORE=$(askDefaultY Install core apps?)
INSTALL_FONTS=$(askDefaultY Install fonts?)
INSTALL_DEV=$(askDefaultN Install dev apps?)
INSTALL_WORK=$(askDefaultN Install work apps?)
INSTALL_STREAM=$(askDefaultN Install streaming apps?)
INSTALL_CREATIVE=$(askDefaultN Install creative apps?)
INSTALL_GAMING=$(askDefaultN Install gaming apps?)

CONFIGURE_MACOS=false
if [[ $OS == "MACOS" ]]; then
    CONFIGURE_MACOS=$(askDefaultN Configure macOS?)
fi

CONFIGURE_DOTFILES=$(askDefaultY Configure dotfiles?)

echo "=========================="
echo "Detected OS:         $OS"
echo "DRYRUN:              $DRYRUN"
echo "VERBOSE:             $VERBOSE"
echo "--------------------------"
echo "INSTALL_CORE:        $INSTALL_CORE"
echo "INSTALL_FONTS:       $INSTALL_FONTS"
echo "INSTALL_DEV:         $INSTALL_DEV"
echo "INSTALL_WORK:        $INSTALL_WORK"
echo "INSTALL_STREAM:      $INSTALL_STREAM"
echo "INSTALL_CREATIVE:    $INSTALL_CREATIVE"
echo "INSTALL_GAMING:      $INSTALL_GAMING"
echo "--------------------------"
echo "CONFIGURE_MACOS:    $CONFIGURE_MACOS"
echo "CONFIGURE_DOTFILES: $CONFIGURE_DOTFILES"
echo "=========================="
echo ""