if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

if [ -x ./.bash_functions ]; then
        . ~/.bash_functions
fi

if [ -x ./.bash_private ]; then
        . ~/.bash_private
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

export EDITOR=vim
