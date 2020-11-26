#!/usr/bin/env bash

echo "*******************************************"
echo "* [1]: RECONSTRUCTION DE L'INDEX DE MANDB *"
echo "*******************************************"
rm -rf /var/cache/man
mandb -c

echo "*************************************"
echo "* [2]: AJOUT DES DEPOTS NECESSAIRES *"
echo "*************************************"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
apt-add-repository "deb https://pkg.jenkins.io/debian-stable binary/"

echo "********************************************************"
echo "* [3]: MISE A JOUR DE LA LISTE DES PAQUETS DISPONIBLES *"
echo "********************************************************"
apt-get update

echo "****************************"
echo "* [4]: INSTALLATION DE VIM *"
echo "****************************"
apt-get install -y vim

echo "*******************************"
echo "* [5]: INSTALLATION DE DOCKER *"
echo "*******************************"
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent docker-ce docker-ce-cli containerd.io
usermod -aG docker vagrant

echo "*************************************************"
echo "* [6]: INSTALLATION DE TREE ET VIDANGE DU CACHE *"
echo "*************************************************"
apt-get install -y tree
apt-get clean -y

echo "****************************************"
echo "* [7]: INSTALLATION DE JAVA ET JENKINS *"
echo "****************************************"
apt-get install -y openjdk-8-jre
apt-get install -y jenkins
usermod -aG docker jenkins

#echo "*********************************************"
#echo " [8]: INSTALLATION PHP, COMPOSER ET SYMFONY *"
#echo "*********************************************"
#apt-get install -y php php-bcmath php-cli php-curl php-zip php-sqlite3 php-mysql php-xml php-mbstring php7.4-gd imagick php7.4-xsl php7.4-intl 
#wget https://getcomposer.org/composer.phar
#mv composer.phar /usr/bin/composer
#chmod +x /usr/bin/composer
#wget https://get.symfony.com/cli/installer -O - | bash
#mv /root/.symfony/bin/symfony /usr/local/bin/symfony


