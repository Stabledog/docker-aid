# bashrc for container /root acct
# Created by docker-aid/make-docker-shell-initfiles.sh
# vim: filetype=sh :

if [[ -z $SHELL ]]; then
    export SHELL=/bin/bash
fi
orgDir=$PWD
cd /root
export ProjectsHome=/root/projects
ln -sf /app ./projects
source ./bin/bashrc-common
cd $orgDir
