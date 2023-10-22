#!/bin/bash

# Update the application packages

# Clone the Laravel repository from GitHub
sudo apt install git -y

web_dir="/var/www/laravel"
if [ ! -d "$web_dir" ]; then
    sudo mkdir -p "$web_dir"
fi

cd /var/www/
sudo git clone https://github.com/laravel/laravel.git

# Change ownership of the Laravel directory
sudo chown -R www-data:www-data /var/www/laravel

# Installing and enabling apache
sudo apt install apache2 -y
sudo ufw allow in "Apache"
sudo ufw status

#Installing mySQl
sudo apt update -y
sudo apt install mysql-server
sudo systemctl start mysql.service

#configure mysql
sudo apt --fix-missing install
sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
exit

Installing PHP and its required modules
sudo apt install php libapache2-mod-php php-mysql -y

Verifying PHP version
php -v

Setting up Laravel virtual host
laravel_conf_file="/etc/apache2/sites-available/laravel.conf"
cat > "$laravel_conf_file" <<EOF
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/laravel/public
    ServerName localhost

    <Directory /var/www/laravel/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

# Enabling the Laravel site and disable the default site
a2ensite laravel
a2dissite 000-default

# Reloading Apache to apply changes
systemctl reload apache2

# Creating a PHP info file
php_info_file="/var/www/default/info.php"
echo "<?php phpinfo();" > "$php_info_file"

# Copy php file to server directory
sudo cp test.php /var/www/html/


# Enabling the PHP info site
a2ensite default

# Reload Apache to apply changes
systemctl reload apache2
