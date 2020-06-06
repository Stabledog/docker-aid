#!/usr/bin/env bash
# setup-user.sh
#  
#  Intended for use in a freshly-created Docker container or similar minimal shell user
#  Running this installs the ~/my-home files for the current user so shell is initalized
#  as needed.
#

Startdir=$(pwd -P) 
function errExit {
    echo "ERROR: $@" >&2
    exit 1
}

if [[ -z $sourceMe ]]; then
    [[ -f ${Startdir}/setup-user.sh ]] || errExit 101
    bakdir=backup/$RANDOM
    mkdir -p $bakdir
    (
        echo "Backing up shell cfg to $bakdir:"
        cd $bakdir || errExit 102
        for file in .bashrc .inputrc .bash_profile .vimrc; do
            if [[ -f ${StartDir}/../${file} ]]; then
                cp ${Startdir}/../${file} ./
            fi
        done
    )
    cd ${Startdir}/.. || errExit 103
    for file in bashrc inputrc bash_profile vimrc; do
        ln -sf my-home/${file} .${file} && echo ".${file} installed in ${Startdir}" || echo "Error installing .${file}" >&2
    done
    mkdir -p .vimtmp
    cat > .gitignore <<EOF
.vimtmp
.bash_history
EOF
    echo "Done, use 'exec bash' to re-init the shell"
fi


