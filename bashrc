# bashrc for container /root acct
# Created by docker-aid/make-docker-shell-initfiles.sh
# vim: filetype=sh :

#echo "Testing: $( test -e /root/projects; echo $?)"

# Much testing and head-scratching has yielded this
# inexplicable hack, which ensures that the projects
# symlink gets created:
xloop=0
while (( xloop++ <= 5 )); do
    ln -sf /app /root/projects &>/dev/null
    if [[ -h /root/projects ]]; then
        break
    fi
    sleep 0.2
    #echo "Looping on projects link creation: $(( xloop ))"
done
export ProjectsHome=/root/projects


source /root/bin/bashrc-common

if [[ $PATH != /root/bin* ]]; then
    # We want first crack at the PATH
    PATH=/root/bin:$PATH
fi


