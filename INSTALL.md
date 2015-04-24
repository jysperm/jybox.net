## Ubuntu 14.04 amd64

    apt-get install python-software-properties software-properties-common
    add-apt-repository ppa:chris-lea/node.js
    apt-get update
    apt-get upgrade

    vi /etc/hostname
    vi /etc/hosts

    apt-get install python g++ make nodejs git nginx redis-server ntp supervisor postfix mariadb-server postgresql postgresql-contrib

    npm install coffee-script harp bower -g

    rm /etc/nginx/sites-enabled/default

    cd /etc/nginx/sites-enabled

    ln -s /home/jybox/jybox.net/configure/nginx/default
    ln -s /home/jybox/jybox.net/configure/nginx/jybox
    ln -s /home/jybox/jybox.net/configure/nginx/bbs
    ln -s /home/jybox/jybox.net/configure/nginx/newsbee
    ln -s /home/jybox/jybox.net/configure/nginx/sentry

    cd /etc/supervisor/conf.d

    ln -s /home/jybox/jybox.net/configure/supervisor/jybox.conf
    ln -s /home/jybox/jybox.net/configure/supervisor/newsbee.conf
    ln -s /home/jybox/jybox.net/configure/supervisor/sentry.conf

    service nginx restart
    service supervisor restart

## Jybox

    git clone https://github.com/jysperm/jybox.net.git

    useradd -m jybox
    usermod -G jybox -a www-data

## Newsbee

    git clone https://github.com/HackPlan/github-commit-ical.git
    git clone https://github.com/HackPlan/random.git

    useradd -m newsbee
    usermod -G newsbee -a www-data

## Sentry

    apt-get install python-pip python-dev libxslt1-dev libxml2-dev libz-dev libffi-dev libssl-dev libpq-dev
    pip install -U virtualenv

    useradd -m sentry
    usermod -G sentry -a www-data

    virtualenv sentry
    source sentry/bin/activate

    pip install -U sentry
    pip install -U sentry[postgres]

## Deploy to remote

    rsync -rpz --exclude .git --exclude-from .gitignore . jybox@jybox.net:~/jybox.net
    ssh jybox@jybox.net 'fuser -k -n tcp 15624'
