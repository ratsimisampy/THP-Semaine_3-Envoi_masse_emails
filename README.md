# THP-Semaine_3-Envoi_masse_emails
The Hacking Project - Teamwork learning, together on a single app in a single repo


# PROJET
## vous allez scrapper, enregistrer dans un spreadsheet, puis envoyer des emails, avec une relance par Twitter. Le tout dans un dossier ruby bien rangé, en POO.

Votre mission est d'envoyer un email à toutes les mairies de trois départements de votre choix et de leur dire qu'ils devraient monter un groupe THP dans leur commune

- *récupérer les emails de trois départements*
=====> OISE-SOMME-AISNE

- *enregistrer ces emails dans un fichier CSV/JSON*
=====> email
=====> nom de la commune
=====> département (numéro ou nom)

- *Envoyer les emails*
=====> (tester sur des BDDs en bois avec vos adresses emails)
=====> reprendre chaque colonne de ton CSV/JSON

```
Bonjour,
Je m'appelle [PRÉNOM], je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de [NOM_COMMUNE] veut changer le monde avec nous ?


Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80
```


- *Petite relance Twitter*
=====> repasser sur chaque élément du CSV/JSON et ajouter une colonne supplémentaire avec le handle twitter (recherche avec mairie [NOM_COMMUNE] en prenant le premier résultat)
=====> follow les users concernés. Avec un compte genre "Apprendre à coder" c'est pas mal

- *Structure du dossier*
=====> Dotenv

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


