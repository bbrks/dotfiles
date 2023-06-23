#!/bin/bash

# function that runs a command or prints he command based on dry run varibale
run_cmd() {
    if [[ "$DRYRUN" == true ]]; then
        echo "$ $@"
    else
        if [[ "$VERBOSE" == true ]]; then
            echo "$ $@"
        fi
        "$@"
    fi
}

# interactive Y/N prompt functions
askDefaultY() {
    local RESULT=true
    while true; do
        read -p "$* [Y/n]: " yn
        case $yn in
            Y|y)
                RESULT=true
                break ;;
            N|n)
                RESULT=false
                break ;;
            "") break ;;
            *) echo "Y or N ... ?";;
        esac
    done
    echo $RESULT
}

askDefaultN() {
    local RESULT=false
    while true; do
        read -p "$* [y/N]: " yn
        case $yn in
            Y|y)
                RESULT=true
                break ;;
            N|n)
                RESULT=false
                break ;;
            "") break ;;
            *) echo "Y or N ... ?";;
        esac
    done
    echo $RESULT
}
