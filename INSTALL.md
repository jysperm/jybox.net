## Ubuntu 14.04 amd64

    apt-get install python-software-properties software-properties-common
    add-apt-repository ppa:chris-lea/node.js
    apt-get update
    apt-get upgrade

    vi /etc/hostname
    vi /etc/hosts

    apt-get install python g++ make nodejs git nginx redis-server ntp supervisor postfix

    npm install coffee-script harp bower -g

    rm /etc/nginx/sites-enabled/default

    cd /etc/nginx/sites-enabled

    ln -s /home/jybox/jybox.net/configure/nginx/default
    ln -s /home/jybox/jybox.net/configure/nginx/jybox
    ln -s /home/jybox/jybox.net/configure/nginx/bbs
    ln -s /home/jybox/jybox.net/configure/nginx/git
    ln -s /home/jybox/jybox.net/configure/nginx/newsbee

    cd /etc/supervisor/conf.d

    ln -s /home/jybox/jybox.net/configure/supervisor/jybox.conf
    ln -s /home/jybox/jybox.net/configure/supervisor/newsbee.conf

    useradd -m jybox
    useradd -m newsbee
    usermod -G jybox -a www-data
    usermod -G newsbee -a www-data
    usermod -G gitlab-www -a www-data

    service nginx restart
    service supervisor restart

## Jybox

    git clone https://github.com/jysperm/jybox.net.git

## Newsbee

    git clone https://github.com/HackPlan/github-commit-ical.git
    git clone https://github.com/HackPlan/random.git

## Gitlab

    wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb
    dpkg -i gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb

    vi /etc/gitlab/gitlab.rb

        external_url 'https://git.jybox.net'
        gitlab_rails['signup_enabled'] = true

    gitlab-ctl reconfigure

## Deploy to remote

    rsync -rpz --exclude .git --exclude-from .gitignore . jybox@jybox.net:~/jybox.net
    ssh jybox@jybox.net 'fuser -k -n tcp 15624'
