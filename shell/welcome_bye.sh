#!/usr/bin/env bash

# Verify if $1 is "hello" or "bye" otherwise print a stopping message and exit program
main() {
    if [[ "$1" -eq "hello" || "$1" -eq "bye" ]]; then
        welcome_bye "$1"
    else
        echo "No argument provided, script requires argument"
        exit 1
    fi
    exit 0
}

# Print byebye or welcome, depends of $1
welcome_bye() {
    if [[ "$1" == "hello" ]]; then
        echo "Welcome ${USER}"
    else
        echo "Byebye ${USER}"
    fi
}

main "$1"
