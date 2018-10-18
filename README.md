# THP-Semaine_3-Envoi_masse_emails
The Hacking Project - Teamwork learning, together on a single app in a single repo

# PROJET
## vous allez scrapper, enregistrer dans un spreadsheet, puu
is envoyer des emails, avec une relance par Twitter. Le touu
t dans un dossier ruby bien rangé, en POO.

Votre mission est d'envoyer un email à toutes les mairies dd
e trois départements de votre choix et de leur dire qu'ils
devraient monter un groupe THP dans leur commune

- *récupérer les emails de trois départements*
=====> OISE-SOMME-AISNE

- *enregistrer ces emails dans un fichier CSV/JSON*
=====> email
=====> nom de la commune
=====> département (numéro ou nom)

- *Envoyer les emails*
=====> reprendre chaque colonne de ton CSV/JSON





~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
```
ultimate_townhall
├── .gitignore
├── .env
├── README.md
├── Gemfile
├── Gemfile.lock
├── app.rb
├── db
│   └── townhalls.csv
└── lib
    ├── app
    │   ├── townhalls_scrapper.rb
    │   ├── townhalls_mailer.rb
    │   ├── townhalls_adder_to_db.rb
    │   └── townhalls_follower.rb
    └── views
        ├── done.rb
        └── index.rb
```
```
la partie d'introduction qui présente l'équipe, explique en un paragraphe les grandes lignes du programme, puis comment l'utiliser ($ bundle install)
une partie qui explique l'arborescence du dossier, et l'utilité de tous les programmes
une partie qui dit comment se servir du programme, et quelles sont les gems utilisées
une partie qui explique ce qui a été fait : l'email envoyé, le nombre de mairies touchées, le handle Twitter qui a été utilisé
```
========================================================

```
Rôles conseillés

Voici une répartition conseillée pour le projet

Une personne qui s'occupe du scrappeur
Une personne qui s'occupe du mailer
Une personne qui s'occupe du bot Twitter
Une personne qui fait les views, et qui s'arrange pour lier tous les programmes entre eux et faire en sorte qu'ils marchent

```


