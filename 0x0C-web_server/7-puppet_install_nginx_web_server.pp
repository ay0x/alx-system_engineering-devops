# Install Nginx web server
exec { 'server configuration':
  provider => shell,
  command  => 'sudo apt-get -y update; sudo apt-get -y install nginx; ufw allow 'Nginx HTTP'; echo 'Hello World!' > /var/www/html/index.nginx-debian.html; sudo sed -i "/server_name _;/a \\\n\\tlocation /redirect_me {\\n\\t\\trewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;\\n\\t}" /etc/nginx/sites-available/default; sudo service nginx start'
}
