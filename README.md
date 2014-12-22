## jybox.net

    rsync -rpz --exclude .git --exclude-from .gitignore . jybox@jybox.net:~/jybox.net
    ssh jybox@jybox.net 'fuser -k -n tcp 15624'
