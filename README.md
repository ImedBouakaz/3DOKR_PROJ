# 3DOKR_PROJ

### Requirements :

- Virtual Box
Pour l'installer : [ici](https://www.virtualbox.org/wiki/Downloads)

- Vagrant
Pour l'installer : [ici](https://developer.hashicorp.com/vagrant/install?product_intent=vagrant)
### Installation Guide

cloner le repo localement
```
git clone https://github.com/ImedBouakaz/3DOKR_PROJ.git
```

Se déplacer dans le fichier : 
```
cd 3DOKR_PROJ
```

Création des VM pour Swarm : 
```
vagrant up 
```
Penser à bien attendre que les VM s'ouvre

Installer le plugin scp de Vagrant : 
```
vagrant plugin install vagrant-scp
vagrant scp 3DOKR_PROJ manager1:~
```

Se connecter à chacune des machines et installer Docker dessus
```
Vagrant ssh manager1
Vagrant ssh worker1
Vagrant ssh worker2
```
Suivre la procédure suivant la distribution installé (ici, Ubuntu) : [ici](https://docs.docker.com/engine/install/)

se reconnecter sur le manager1, et construire le Swarm : 
```
docker swarm init --advertise-addr 192.168.99.100
```
Le stdout de la commande donnera une nouvelle commande de la forme :
```
 docker swarm join --token [token-id-abc...]
```
à exécuter sur les 2 workers

Retourner sur le manager1

```
cd 3DOKR_PROJ
docker stack deploy --compose-file Docker-compose.yml dog-cat
```
