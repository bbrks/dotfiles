#!/bin/sh

# Core apps
APPS_CORE=(jump ripgrep htop neovim sublime-text vlc spotify firefox)
APPS_FONTS=()
APPS_DEV=(git go sublime-merge)
APPS_WORK=(slack zoom)
APPS_STREAM=()
APPS_CREATIVE=()
APPS_GAMING=(steam)

INSTALL_CMD=""
if [[ "$OS" == "MACOS" ]]; then
    APPS_CORE+=(iterm2 sublime-text daisydisk scroll-reverser easy-move-plus-resize sizeup the-unarchiver)
    APPS_FONTS+=(font-go font-cozette)
    APPS_DEV+=(hex-fiend monodraw)
    APPS_DEV_FORCE_CASK=(wireshark dash docker)
    APPS_WORK+=()
    APPS_STREAM+=(obs)
    APPS_CREATIVE+=(adobe-creative-cloud)
    APPS_GAMING+=()

    INSTALL_CMD="brew install"
    run_cmd brew update
    run_cmd brew upgrade
    run_cmd brew analytics off
    run_cmd brew tap homebrew/cask-fonts
elif [[ "$OS" == "ARCH" ]]; then
    APPS_CORE+=(sublime-text-4)
    APPS_FONTS+=(ttf-go-mono-git cozette-ttf cozette-otb)
    APPS_DEV+=(wireshark zeal-git docker)
    APPS_WORK+=()
    APPS_STREAM+=(obs-studio)
    APPS_CREATIVE+=()
    APPS_GAMING+=()

    INSTALL_CMD="yay -S"
    run_cmd yay -Syu
else
    echo "Unsupported OS for app installs: $OS"
    exit 127
fi

# build full apps lists where possible
APPS_ADD=()
if [[ "$INSTALL_CORE" == true ]]; then
    APPS_ADD+=("${APPS_CORE[@]}")
fi
if [[ "$INSTALL_FONTS" == true ]]; then
    APPS_ADD+=("${APPS_FONTS[@]}")
fi
if [[ "$INSTALL_DEV" == true ]]; then
    APPS_ADD+=("${APPS_DEV[@]}")
fi
if [[ "$INSTALL_WORK" == true ]]; then
    APPS_ADD+=("${APPS_WORK[@]}")
fi
if [[ "$INSTALL_STREAM" == true ]]; then
    APPS_ADD+=("${APPS_STREAM[@]}")
fi
if [[ "$INSTALL_CREATIVE" == true ]]; then
    APPS_ADD+=("${APPS_CREATIVE[@]}")
fi
if [[ "$INSTALL_GAMING" == true ]]; then
    APPS_ADD+=("${APPS_GAMING[@]}")
fi

run_cmd $INSTALL_CMD ${APPS_ADD[@]}

    # cask special case
APPS_ADD_CASK=("${APPS_DEV_FORCE_CASK[@]}")
if [[ "$INSTALL_DEV" == true ]]; then
    run_cmd brew install --cask ${APPS_ADD_CASK[@]}
fi