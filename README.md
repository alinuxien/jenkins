# Bienvenue sur mon projet de VM Jenkins + Blue Ocean !
Il s'agit d'un projet réalisé en Novembre-Décembre 2020 dans le cadre de ma formation "Expert DevOps" chez OpenClassRooms.

## Ca fait quoi ?
Ca crée une VM Virtual Box sur une base Ubuntu 20.04, avec des ports mappés, et avec des outils installés, en particulier Jenkins.

## Contenu ?
Un Vangrantfile et un script bootstrap.sh

## J'ai besoin de quoi ?
De [Virtual Box](https://www.virtualbox.org/) et de [Vagrant](https://www.vagrantup.com/downloads) installés sur la machine. 

## Comment ça s'utilise ?
La préparation et le lancement de la VM se fait en 1 seule commande, dans le dossier qui contient le Dockerfile.

( Vous pouvez personnaliser le nombre de Cores dédiés à cette VM ainsi que la quantité de RAM )
### Build & Run
vagrant up

## Ca a marché ?
### On peut se connecter en ssh sur la VM
vagrant ssh

Dans un navigateur web, on peut accéder à Jenkins à l'adresse [http://localhost:8080/](http://localhost:8080/)

# Et après ?
Il suffit d'installer les plugins ( par exemple Blue Ocean ), créer et paramétrer un nouveau "Projet"....

Par exemple, je vous propose mon projet de [CI orienté QA pour PrestaShop](https://github.com/alinuxien/PrestaShop)

