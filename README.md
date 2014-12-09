## jybox.net

    rsync -rpz --progress --exclude-from .gitignore . nodeapp@jybox.rpvhost.net:~/jybox.net
    ssh nodeapp@jybox.rpvhost.net 'fuser -k -n tcp 15624'
