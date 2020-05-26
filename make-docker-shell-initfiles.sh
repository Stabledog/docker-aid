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
    mkdir -p ./container-init/{bin,my-home/backup}
    cd ./container-init || errExit "Failed cd ./container-init"
    cp $Docker_aid/bashrc-common ./bin || errExit 101
    cp $Docker_aid/inputrc my-home/inputrc || errExit 102
    cp $Docker_aid/bashrc my-home/bashrc || errExit 103
    cp $Docker_aid/bash_profile my-home/bash_profile || errExit 104
    cp $Docker_aid/setup-user.sh my-home/setup-user.sh || errExit 105
    chmod +x my-home/setup-user.sh
    cp $Docker_aid/basic-vimrc.vim my-home/vimrc || errExit 106
    touch docker-aid-initialized

    echo "Files in container-init created/updated.  Run ~/my-home/setup-user.sh within the container to install."
fi
