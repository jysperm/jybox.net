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

    vi /etc/nginx/sites-enabled/jybox.net

        server {
            listen 80 default_server;
            listen [::]:80 default_server ipv6only=on;
            rewrite ^/(.*)$ https://jybox.net/#redirect permanent;
        }

        server {
           listen 80;
           server_name jybox.net;
           return 301 https://$server_name$request_uri;
        }

        server {
            listen 443 ssl;
            server_name jybox.net;

            keepalive_timeout 70;

            ssl_certificate /home/nodeapp/jybox.net/jybox.net.crt;
            ssl_certificate_key /home/nodeapp/keys/jybox.net.key;
            ssl_session_cache shared:SSL:10m;
            ssl_session_timeout 10m;

            location ~ /\.git {
              deny all;
            }

            location / {
                proxy_set_header X-Real-IP $remote_addr;
                proxy_pass http://127.0.0.1:15624;
            }
        }

    useradd -m nodeapp
    usermod -G nodeapp -a www-data

    su nodeapp

    git clone https://github.com/jysperm/jybox.net.git
    cd jybox.net

    npm install

    exit

    vi /etc/supervisor/conf.d/jybox.net.conf

        [program:jybox.net]
        command=coffee /home/nodeapp/jybox.net/app.coffee
        autorestart=true
        user=nodeapp

    service nginx restart
    service supervisor restart
