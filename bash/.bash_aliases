if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls="ls -FGh"
else
    alias ls="ls --color=auto -Fh"
fi

alias c="clear && printf '\e[3J'"
alias rm="rm -i"
