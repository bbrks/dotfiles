if [ -x ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -x ./.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -x ./.bash_private ]; then
    . ~/.bash_private
fi

if [ -x ~/.bashrc.ubuntu ]; then
    . ~/.bashrc.ubuntu
fi

GIT_PROMPT_THEME=Custom
if [ -x ~/.bash-git-prompt/gitprompt.sh ]; then
    . ~/.bash-git-prompt/gitprompt.sh
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export EDITOR=vim

# Set up Go environment
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
mkdir -p $GOPATH

# Execute node binaries in projects
export PATH=$PATH:.node_modules/bin

eval "$(jump shell bash)"

# Jump to symlink destination
set -o physical

#archey
