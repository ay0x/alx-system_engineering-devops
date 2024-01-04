# Install Nginx web server

exec { 'apt-update':
  command => '/usr/bin/apt-get -y update',
  path    => '/usr/bin:/usr/local/bin:/bin',
}

exec { 'apt-install-nginx':
  command => '/usr/bin/apt-get -y install nginx',
  path    => '/usr/bin:/usr/local/bin:/bin',
}

exec { 'ufw-allow-nginx-http':
  command => '/usr/sbin/ufw allow "Nginx HTTP"',
  path    => '/usr/bin:/usr/local/bin:/bin',
}

exec { 'create-index-file':
  command => '/bin/echo "Hello World!" > /var/www/html/index.nginx-debian.html',
  path    => '/usr/bin:/usr/local/bin:/bin',
}

exec { 'configure-nginx':
  command => '/bin/sed -i "/server_name _;/a \\n\\tlocation /redirect_me {\\n\\t\\trewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;\\n\\t}" /etc/nginx/sites-available/default',
  path    => '/usr/bin:/usr/local/bin:/bin',
}

exec { 'start-nginx-service':
  command => '/usr/sbin/service nginx start',
  path    => '/usr/bin:/usr/local/bin:/bin',
}
