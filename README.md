# dotfiles

Clone and run `init.sh`, follow the interactive instructions.

## Prerequisites

- OS/Disto: `macOS` or `Arch`
- Everything else the scripts should handle.

## Example

```sh
 $ ./init.sh

==========================
===== Configuration ======
==========================
Dry run? [Y/n]: Y
Install core apps? [Y/n]: Y
Install fonts? [Y/n]: Y
Install dev apps? [y/N]: N
Install work apps? [y/N]: N
Install streaming apps? [y/N]: N
Install creative apps? [y/N]: N
Install gaming apps? [y/N]: N
Configure macOS? [y/N]: N
Configure dotfiles? [Y/n]: Y
==========================
Detected OS:         MACOS
DRYRUN:              true
VERBOSE:             false
--------------------------
INSTALL_CORE:        true
INSTALL_FONTS:       true
INSTALL_DEV:         false
INSTALL_WORK:        false
INSTALL_STREAM:      false
INSTALL_CREATIVE:    false
INSTALL_GAMING:      false
--------------------------
CONFIGURE_MACOS:    false
CONFIGURE_DOTFILES: true
==========================

$ brew update
$ brew upgrade
$ brew analytics off
$ brew tap homebrew/cask-fonts
$ brew install jump ripgrep htop neovim sublime-text vlc spotify firefox iterm2 sublime-text daisydisk scroll-reverser easy-move-plus-resize sizeup the-unarchiver font-go font-cozette
$ git submodule init
$ git submodule update
$ stow --ignore=^init.sh$ bash-git-prompt
$ stow --ignore=^init.sh$ bash
$ stow --ignore=^init.sh$ git
$ stow --ignore=^init.sh$ hushlogin
$ stow --ignore=^init.sh$ iterm
$ stow --ignore=^init.sh$ ssh
$ stow --ignore=^init.sh$ tmux
$ ./vim/init.sh
$ stow --ignore=^init.sh$ vim
$ stow --ignore=^init.sh$ zsh
```
