## Ubuntu 14.04 amd64

    apt-get install python-software-properties software-properties-common
    add-apt-repository ppa:chris-lea/node.js
    apt-get update
    apt-get upgrade

    vi /etc/hostname
    vi /etc/hosts

    apt-get install python g++ make nodejs git nginx redis-server ntp supervisor postfix

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
    ln -s /home/nodeapp/jybox.net/configure/nginx/git /etc/nginx/sites-enabled/git
    ln -s /home/nodeapp/jybox.net/configure/supervisor/jybox.net.conf /etc/supervisor/conf.d/jybox.net.conf

    wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb
    dpkg -i gitlab_7.4.3-omnibus.5.1.0.ci-1_amd64.deb

    vi /etc/gitlab/gitlab.rb

        external_url 'https://git.jybox.net'
        gitlab_rails['signup_enabled'] = true

    gitlab-ctl reconfigure

    service nginx restart
    service supervisor restart
