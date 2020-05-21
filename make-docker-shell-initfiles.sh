#!/bin/bash
# Create suitable shell-init profiles for docker containers
# Writes to ./container-init, and anything placed there should
# be copied to the /root dir in the container image
#

Docker_aid=$(dirname $(realpath $0))

function errExit {
    echo "ERROR: $@" >&2
    exit 1
}

if [[ -z $sourceMe ]]; then
    [[ -f not_here ]] && errExit "Cant run here because ./not_here present"
    mkdir -p ./container-init/bin
    cd ./container-init || errExit "Failed cd ./container-init"
    cp $Docker_aid/bashrc-common ./bin || errExit 101
    cp $Docker_aid/inputrc .inputrc || errExit 102
    cp $Docker_aid/bashrc .bashrc || errExit 103
    cp $Docker_aid/bash_profile .bash_profile || errExit 104
    ln -sf / projects
    touch docker-aid-initialized
fi
