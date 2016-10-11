if [ -x ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -x ./.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -x ./.bash_private ]; then
    . ~/.bash_private
fi

if [ -x ./.bash-git-prompt/gitprompt.sh ]; then
    . ~/.bash-git-prompt/gitprompt.sh
fi

if [ -x /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -x $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Start tmux by default in new shells
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

export EDITOR=nano

# Set up Go environment
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:.node_modules/bin
