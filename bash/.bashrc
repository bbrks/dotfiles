#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

GIT_PROMPT_THEME=Custom
[[ -x ~/.bash-git-prompt/gitprompt.sh ]] && . ~/.bash-git-prompt/gitprompt.sh

#[[ -f /usr/share/bash-completion/bash_completion ]] && /usr/share/bash-completion/bash_completion
#[[ -f $(brew --prefix)/share/bash-completion/bash_completion ]] && $(brew --prefix)/share/bash-completion/bash_completion

# Jump to symlink destination
set -o physical

# Set up Go environment
export GOPATH=$HOME/dev/go
mkdir -p $GOPATH

export GPG_TTY=$(tty)
export SG_COLOR=true # Couchbase Sync Gateway colours by default
export EDITOR=vim

# Set PATHs
export PATH=$GOPATH/bin:$PATH
[[ -x $(command -v brew) ]] && [[ -d $(brew --prefix)/bin ]] && export PATH=$(brew --prefix)/bin:$PATH

# Set shell hooks
[[ -x $(command -v jump) ]] && eval "$(jump shell bash)"
[[ -x $(command -v direnv) ]] && eval "$(direnv hook bash)"

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bashrc.arch ]] && . ~/.bashrc.arch
[[ -f ~/.bashrc.macos ]] && . ~/.bashrc.macos
