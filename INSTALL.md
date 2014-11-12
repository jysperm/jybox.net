## Ubuntu 14.04 amd64

    apt-get install python-software-properties software-properties-common
    add-apt-repository ppa:chris-lea/node.js
    apt-get update
    apt-get upgrade

    vi /etc/hostname
    vi /etc/hosts

    apt-get install python g++ make nodejs git nginx redis-server ntp supervisor

    npm install coffee-script -g

    rm /etc/nginx/sites-enabled/default

    useradd -m nodeapp
    usermod -G nodeapp -a www-data

    su nodeapp

    git clone https://github.com/jysperm/jybox.net.git
    cd jybox.net

    npm install

    exit

    ln -s /home/nodeapp/jybox.net/configure/nginx/default /etc/nginx/sites-enabled/default
    ln -s /home/nodeapp/jybox.net/configure/nginx/jybox.net /etc/nginx/sites-enabled/jybox.net
    ln -s /home/nodeapp/jybox.net/configure/nginx/old-bbs /etc/nginx/sites-enabled/old-bbs
    ln -s /home/nodeapp/jybox.net/configure/supervisor/jybox.net.conf /etc/supervisor/conf.d/jybox.net.conf

    service nginx restart
    service supervisor restart
