# 3DOKR_PROJ

Conteneurisation d'une application web de vote.

## Requirements

[Vagrant](https://developer.hashicorp.com/vagrant/install) Pour déployer le cluster.\
[VirtualBox](https://www.virtualbox.org/wiki/Downloads) Pour accueillir le cluster.

## Installation

Clonez le répertoire
```bash
git clone https://github.com/ImedBouakaz/3DOKR_PROJ.git
cd 3DOKR_PROJ
```
Initialisez les VMs avec Vagrant (Peut prendre un peu de temps)
```bash
vagrant up
```
Copiez le projet vers manager1

- Installez d'abord le plugin SCP
```bash
vagrant plugin install vagrant-scp
```
- Et copiez ensuite le dossier
```bash
vagrant scp ../3DOKR_PROJ manager1:~
```
Maintenant, connectez vous au manager1 pour build le swarm
```bash
Vagrant ssh manager1
~$ docker swarm init --advertise-addr 192.168.99.100
```
La commande va vous retourner une autre commande similaire à celle ci:
```bash
docker swarm join --token [token-id-abc...]
```
Elle est à exécuter sur les deux workers

Retournez ensuite sur le manager1 pour déployer les Dockers:
```bash
cd 3DOKR_PROJ
~$ docker stack deploy --compose-file compose.yaml dog-cat
```
## Utilisation

Après avoir suivi les instructions, vous serez en mesure de voter et de consulter les votes via les adresses suivantes:

[http://192.168.99.100:8080](http://192.168.99.100:8082) (Vote)\
[http://192.168.99.100:8081](http://192.168.99.100:8081) (Résultats)
