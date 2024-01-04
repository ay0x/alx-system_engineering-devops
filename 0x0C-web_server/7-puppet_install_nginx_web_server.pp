# Install Nginx web server with puppet

exec { 'apt-get -y update':
  path => '/usr/bin/:/usr/local/bin/:/bin/:/usr/sbin/'
}

exec { 'apt-get -y install nginx':
  path => '/usr/bin/:/usr/local/bin/:/bin/:/usr/sbin/'
}

exec { 'ufw allow "Nginx HTTP"':
  path => '/usr/bin/:/usr/local/bin/:/bin/:/usr/sbin/'
}

exec { 'echo "Hello World!" > /var/www/html/index.nginx-debian.html':
  path => '/usr/bin/:/usr/local/bin/:/bin/:/usr/sbin/'
}

exec { 'sed -i "/server_name _;/a \\\n\\tlocation /redirect_me {\\n\\t\\trewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;\\n\\t}" /etc/nginx/sites-available/default':
  path => '/usr/bin/:/usr/local/bin/:/bin/:/usr/sbin/'
}

exec { 'service nginx start':
  path => '/usr/bin/:/usr/local/bin/:/bin/:/usr/sbin/'
}
