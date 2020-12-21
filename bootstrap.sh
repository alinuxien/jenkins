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

echo "*************************************************"
echo "* [4]: INSTALLATION DE DOCKER ET DOCKER-COMPOSE *"
echo "*************************************************"
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent docker-ce docker-ce-cli containerd.io docker-compose
usermod -aG docker vagrant

echo "*************************************************"
echo "* [5]: INSTALLATION DE TREE ET VIDANGE DU CACHE *"
echo "*************************************************"
apt-get install -y tree
apt-get clean -y

echo "***************************************************************************************"
echo "* [6]: INSTALLATION DE PYTHON, PIP, XVFB, SELENIUM, CHROME ET DRIVER, JAVA ET JENKINS *"
echo "***************************************************************************************"
apt-get install -y python3.8 python3-pip
pip3 install selenium
pip3 install html-testRunner
apt-get install -y xvfb
sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-get update
apt-get install -y google-chrome-stable
wget -q https://chromedriver.storage.googleapis.com/87.0.4280.88/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
cp chromedriver /usr/local/bin
apt-get install -y openjdk-8-jre
apt-get install -y jenkins
usermod -aG docker jenkins

echo "*********************************************************"
echo "* [7]: INSTALLATION DE APACHE, MYSQL, PHP, ET COMPOSER  *"
echo "*********************************************************"
apt-get install -y apache2 mysql-server php7.4 php-fpm php-cgi php7.4-bcmath php7.4-cli php7.4-curl php7.4-zip php7.4-sqlite3 php7.4-mysql php7.4-xml php7.4-mbstring php7.4-gd php-imagick php7.4-xsl php7.4-intl php-memcached
sed -i 's/post_max_size = 8M/post_max_size = 128M/g' /etc/php/7.4/apache2/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 128M/g' /etc/php/7.4/apache2/php.ini
sed -i 's/;max_input_vars = 1000/max_input_vars = 5000/g' /etc/php/7.4/apache2/php.ini
sed -i 's/memory_limit = 128M/memory_limit = 256M/g' /etc/php/7.4/apache2/php.ini
sed -i 's/pm.max_children = 5/pm.max_children = 128/g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/pm.start_servers = 2/pm.start_servers = 32/g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/pm.min_spare_servers = 1/pm.min_spare_servers = 16/g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/pm.max_spare_servers = 3/pm.max_spare_servers = 32/g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/;pm.max_requests = 500/pm.max_requests = 1000/g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/StartServers\t*\s*2/StartServers                     8/g' /etc/apache2/mods-available/mpm_event.conf
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
a2enmod rewrite
a2enmod proxy_fcgi setenvif
a2enconf php7.4-fpm
source /etc/apache2/envvars
systemctl restart apache2
wget https://getcomposer.org/composer.phar
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer
apt-get install -y composer

echo "**************************************"
echo "* [8]: INSTALLATION DE NPM ET UNZIP  *"
echo "**************************************"
apt-get install -y npm unzip

