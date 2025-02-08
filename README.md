# 3DOKR_PROJ

**Conteneurisation d'une application web de vote avec Docker Swarm.**

## Prérequis

Assurez-vous d'avoir installé les outils suivants :

- [Vagrant](https://developer.hashicorp.com/vagrant/install) – Pour déployer le cluster.
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) – Pour exécuter les machines virtuelles.

## Installation

1. **Cloner le dépôt :**
   ```bash
   git clone https://github.com/ImedBouakaz/3DOKR_PROJ.git
   cd 3DOKR_PROJ
   ```

2. **Initialiser le cluster avec Vagrant** (cette étape peut prendre un certain temps) :
   ```bash
   vagrant up
   ```

3. **Copier le projet sur `manager1`** :

   - Installer le plugin SCP pour Vagrant :
     ```bash
     vagrant plugin install vagrant-scp
     ```
   - Copier le projet vers `manager1` :
     ```bash
     vagrant scp ../3DOKR_PROJ manager1:~
     ```

4. **Configurer Docker Swarm** :

   - Se connecter au nœud `manager1` :
     ```bash
     vagrant ssh manager1
     ```
   - Initialiser le Swarm :
     ```bash
     docker swarm init --advertise-addr 192.168.99.100
     ```
   - La commande retourne une ligne similaire à celle-ci :
     ```bash
     docker swarm join --token [token-id-abc...]
     ```
     **Exécutez cette commande sur chaque nœud worker** pour les joindre au cluster.

5. **Déployer l'application avec Docker Stack** :

   - Depuis `manager1`, naviguer dans le projet :
     ```bash
     cd 3DOKR_PROJ
     ```
   - Déployer les services :
     ```bash
     docker stack deploy --compose-file compose.yaml dog-cat
     ```

## Utilisation

Une fois le déploiement terminé, vous pouvez accéder à l'application via les adresses suivantes :

- **Vote** : [http://192.168.99.100:8080](http://192.168.99.100:8080)
- **Résultats** : [http://192.168.99.100:8081](http://192.168.99.100:8081)

## Monitoring

Vous pouvez surveiller l'application à l'aide de Grafana :

- **Grafana** : [http://192.168.99.100:3000](http://192.168.99.100:3000)
- **Identifiants par défaut** : `admin:admin`
- **Ajouter la source de données Prometheus (dans l'onglet `Data Source`)** : `http://10.0.2.15:9090`
- **Importer des dashboards** : Utilisez ceux proposés par Grafana ou bien des dashboards personnalisés comme celui proposé dans le projet.
