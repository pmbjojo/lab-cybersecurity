# Projet Vagrant
Fichiers pour la mise en place du projet Vagrant du module Introduction Infrastructure du semestre 7
## Pré-requis
### Ressources 
Pour faire fonctionner ce Labs il faut prévoir au moins 2 CPU /coeurs et 4Go de Ram (8Go est plus judicieux). L'espace disque est de l'ordre des 16 Go.
La virtualisation doit être activée sur le PC hôte (machine physique )
<https://support.bluestacks.com/hc/fr-fr/articles/115003174386-Comment-puis-je-activer-la-virtualisation-VT-sur-mon-PC->
### Applications
* Oracle Virtualbox (version 6.1) (<https://www.virtualbox.org/wiki/Downloads>)
* Oracle VM VirtualBox Extension Pack (adapté à la version de virtualbox installée précédement)
* HashiCorp Vagrant (<https://www.vagrantup.com/>)
### Fichiers
* cloner avec git : git clone <https://github.com/chavinje/S7-projet-il.git>
Vous trouverez les reperoires/fichiers :
* ./Vagrantfile : qui contient l'ensemble des déclarations pour la construction du Labs
* scripts/sys.sh : mise en place des configurations de base sur toutes les VMs
* scripts/mysql.sh : Mise en place de la base de données mysql
* scripts/dvwa.sh : Mise en place de l'application DVWA
* scripts/apache.sh : Mise en place du serveur Apache2
## Description du Labs
Le labs est constitué de 3 machines virtuelles Virtualbox basé sur la box chavinje/fr-bull-64
Ces machines sont reliées à votre machine réelle par un réseau privé hôte via l'adresse 192.168.56.0
* L'application DVWA est accéssible par l'adresse <http://192.168.56.22>
## Utilisation des commandes vagrant
### Télécharger une box modèle
```
vagrant box add <box>
```
### Activer une VM uniquement
```
vagrant up <vm>
```
### Activer toutes les VMs
```
vagrant up
```
### Se connecter à une VM
```
vagrant ssh <vm>
```
### Arréter une VM
```
vagrant halt <vm>
```
### Arréter toutes les VMs
```
vagrant halt
```
### Détruire une VM
```
vagrant destroy <vm>
```
### Détruire toutes les VMs
```
vagrant destroy
```