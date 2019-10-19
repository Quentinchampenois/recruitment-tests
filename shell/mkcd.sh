#!/usr/bin/env bash

# mkcd function create folder, and .gitkeep file in then change directory
mkcd() {

    username=$(whoami)
    if [ ! -d ${username}-folder ]
    then
        mkdir ${username}-folder
        touch ./${username}-folder/.gitkeep
        cd ./${username}-folder/
    else
        echo "File already existing"
    fi

    exit 0
}

mkcd
