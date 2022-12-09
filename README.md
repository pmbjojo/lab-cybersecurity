# Projet Vagrant

Fichiers pour la mise en place du projet Vagrant du module Introduction Infrastructure du semestre 7

* Le dossier ansible provisionne le lab en utilisant ansible (a préférer)  
Veuillez installer ansible via le package associé à votre distribution ou via pip.

* Le dossier simple provisionne le lab en utilisant des scripts bash.

Attention : Le dossier simple ne contient pas la vm webgoat, l'application webgoat n'est donc pas accessible si le lab a été créé depuis cette source.

## Pré-requis

### Ressources

Pour faire fonctionner ce Labs il faut prévoir au moins 2 CPU /coeurs et 4Go de Ram (8Go est plus judicieux). L'espace disque est de l'ordre des 16 Go.
La virtualisation doit être activée sur le PC hôte (machine physique )
<https://support.bluestacks.com/hc/fr-fr/articles/115003174386-Comment-puis-je-activer-la-virtualisation-VT-sur-mon-PC->

### Applications

* Oracle Virtualbox (version 6.1) (<https://www.virtualbox.org/wiki/Downloads>)
* Oracle VM VirtualBox Extension Pack (adapté à la version de virtualbox installée précédement)
* HashiCorp Vagrant (<https://www.vagrantup.com/>)
* RedHat Ansible (<https://www.ansible.com/>)

## Description du Labs

Le labs est constitué de 3 machines virtuelles Virtualbox basé sur la box chavinje/fr-bull-64
Ces machines sont reliées à votre machine réelle par un réseau privé hôte via l'adresse 192.168.56.0

* L'application DVWA est accéssible par l'adresse <http://192.168.56.22>
* L'application webgoat est accéssible par l'adresse <http://192.168.56.44:8080/WebGoat>

## Utilisation des commandes vagrant

### Télécharger une box modèle

```shell
vagrant box add <box>
```

### Activer une VM uniquement

```shell
vagrant up <vm>
```

### Activer toutes les VMs

```shell
vagrant up
```

### Se connecter à une VM

```shell
vagrant ssh <vm>
```

### Arréter une VM

```shell
vagrant halt <vm>
```

### Arréter toutes les VMs

```shell
vagrant halt
```

### Détruire une VM

```shell
vagrant destroy <vm>
```

### Détruire toutes les VMs

```shell
vagrant destroy
```
