#!/usr/bin/env bash

# mkcd function create folder, and .gitkeep file in then change directory
mkcd() {
    # find user name
    username=$(whoami)
    # if the folder already exists, print a message otherwise create new folder and a file within
    if [ ! -d ${username}-folder ]
    then
        mkdir "${username}-folder"
        touch "${username}-folder/.gitkeep"
        # TODO: find a way to change directory in the current shell
        cd "$PWD/${username}-folder/" || echo "can't change directory"
    else
        echo "Folder exists"
    fi

    exit 0
}

mkcd