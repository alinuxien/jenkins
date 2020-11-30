#!/usr/bin/env bash

echo "*************************************"
echo "* [1]: AJOUT DES DEPOTS NECESSAIRES *"
echo "*************************************"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
apt-add-repository "deb https://pkg.jenkins.io/debian-stable binary/"

echo "********************************************************"
echo "* [2]: MISE A JOUR DE LA LISTE DES PAQUETS DISPONIBLES *"
echo "********************************************************"
apt-get update

echo "****************************"
echo "* [3]: INSTALLATION DE VIM *"
echo "****************************"
apt-get install -y vim

echo "*******************************"
echo "* [4]: INSTALLATION DE DOCKER *"
echo "*******************************"
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent docker-ce docker-ce-cli containerd.io
usermod -aG docker vagrant

echo "*************************************************"
echo "* [5]: INSTALLATION DE TREE ET VIDANGE DU CACHE *"
echo "*************************************************"
apt-get install -y tree
apt-get clean -y

echo "****************************************"
echo "* [6]: INSTALLATION DE JAVA ET JENKINS *"
echo "****************************************"
apt-get install -y openjdk-8-jre
apt-get install -y jenkins
usermod -aG docker jenkins

echo "*********************************************************"
echo "* [7]: INSTALLATION DE APACHE, MYSQL, PHP, ET COMPOSER  *"
echo "*********************************************************"
apt-get install -y apache2 mysql-server php7.4 php7.4-bcmath php7.4-cli php7.4-curl php7.4-zip php7.4-sqlite3 php7.4-mysql php7.4-xml php7.4-mbstring php7.4-gd php-imagick php7.4-xsl php7.4-intl php-memcached
sed -i 's/post_max_size = 8M/post_max_size = 128M/g' /etc/php/7.4/apache2/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 128M/g' /etc/php/7.4/apache2/php.ini
sed -i 's/;max_input_vars = 1000/max_input_vars = 5000/g' /etc/php/7.4/apache2/php.ini
sed -i 's/memory_limit = 128M/memory_limit = 256M/g' /etc/php/7.4/apache2/php.ini
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
a2enmod rewrite
source /etc/apache2/envvars
systemctl restart apache2
wget https://getcomposer.org/composer.phar
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer

echo "**************************************"
echo "* [8]: INSTALLATION DE NPM ET UNZIP  *"
echo "**************************************"
apt-get install -y npm unzip

