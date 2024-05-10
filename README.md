# Mini jeu dans le terminal

## Overview

Ce mini jeu permet de réaliser des parties contre deux ou plusieurs bots. Il existe 3 versions du jeu.

## Get started

````sh
bundler install # installer les dépendances
ruby nom_du_fichier.rb # Commencer des parties suivant la version que l'on veut tester
````

## arborescence de ce qui nous intéresse

````sh
/lib
    /game.rb #Class game qui gère les parties
    /player.rb #Class player qui gère les joueurs
/app.rb #V1 du jeu : Création de joueurs en auto. Visualisation d'une partie auto entre deux bots.
/app_2.rb #V2 du jeu : Nouveau joueur : HumanPlayer. Joue contre les 2 bots.
/app_3.rb #V3 du jeu : Nombre de bots doublé. Tri des méthodes car ajout de la class Game.
````
