# .bash_profile for docker-aid


if [[ $SHELL != *bash ]]; then
    export SHELL=$(type -p bash)
    exec $SHELL -l
else
    export HOME=/root
    orgDir=$PWD
    cd /root
    [[ -h /root/projects ]] || ln -sf /app /root/projects
    export ProjectsHome=/root/projects
    source /root/.bashrc
    cd $orgDir
fi

