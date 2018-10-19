# THP-Semaine_3-Envoi_masse_emails
[The Hacking Project](https://www.thehackingproject.org) - Teamwork learning, together on a single app in a single repo

## with [Sonia](https://thehackingproject.slack.com/messages/C3W8B8C6N/team/UD27A19J8/), [Marguaux](https://thehackingproject.slack.com/messages/C3W8B8C6N/team/UD3P9GUFQ/), [Laurie](https://thehackingproject.slack.com/team/UD1EZFQE5) & [Tim](https://thehackingproject.slack.com/team/UD0SS562D)

After 2 weeks...


- Tu peux envoyer des mails aux mairies de France en utilisant http://annuaire-des-mairies.com ou tu peux faire :
```
git clone https://github.com/Mate2xo/THP-Semaine_3-Envoi_masse_emails.git
cd THP-Semaine_3-Envoi_masse_emails
```
- [Créer une API google-drive](https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md)

- Personnaliser votre message et les départements ciblés puis...
```
git bundle install
ruby app.rb

```
- Votre promotion est faite   :riche:   
**BONUS : Follow les maires sur twitter, si tu récupéres les [Keys API](https://developer.twitter.com)**

## Organisation du dossier
```
ultimate_townhall
├── .gitignore
├── .env
├── README.md
├── Gemfile
├── Gemfile.lock
├── app.rb
├── db
│   └── townhalls.json
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

#### .gitignore

On vous donne le code, vous voulez quand même pas quand vous donne nos Key!
Aller en récupérer [ici](https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md)

**Notre fichier .env est codé comme ça, vous pouvez copier si ça vou chante :** 
```
{
  "client_id": ""
  "client_secret": ""
}
```

### README.md

Vous y êtes!

#### Gemfile

- *gem dotenv* : **pour utiliser le fichier .env**
- *ruby '2.5.1'* : **on code en ruby ici**
- *gem 'rubocop'* : **pour indenter nos fichiers (chacun a sa façon de coder!)**
- *source "https://rubygems.org"* : **il manquerait plus qu'on code les gem!**
- *gem 'twitter'* : **pour utiliser l'API twitter et follow les maires**
- *gem 'google_drive'* : **pour stocker les données sur le cloud, ET OUAIS ça fait beaucoup de monde!**
- *gem 'google-api-client'* : **pour l'API google**
- *gem 'nokogiri'* : **pour récupérer données en xpath ou css**
- *gem 'json'* : **pour lire et écrire notre base de donnée**

#### 

### Gemfile.lock

Le fichier va s'actualiser tout seul grâce à la commande `bundle install`

#### app.rb

Réunion de tous les fichiers!

#### db

Base de donnée récupérée et stocker ici, dans *townhalls.json*
#### lib/app

Toutes les fonctions codées ici chacune mise dans une class

*townhalls_scrapper.rb* : code pour récupérer données
*townhalls_mailer.rb* : code pour envoyer mails
*townhalls_adder_to_db.rb* : code pour stocker mails dans *db/townhalls.json*
*townhalls_follower.rb* : code pour follow les maires de France sur twitter

#### lib/view

Pour visualiser le code c'est ici!

*index.rb* : Pour commencer
*done.rb* : Pour terminer








Petite prémice...
---------------------------------------------------------------


#### scrapper, enregistrer dans un spreadsheet, puis envoyer des emails, avec une relance par Twitter. Le tout dans un dossier ruby bien rangé, en POO.

Votre mission est d'envoyer un email à toutes les mairies de trois départements de votre choix et de leur dire qu'ils devraient monter un groupe THP dans leur commune

## [OPÉRATION MARGUAUX](https://github.com/MJ75000)
- *récupérer les emails de trois départements*

=====> OISE-SOMME-AISNE

=====> enregistrer ces emails dans un fichier CSV/JSON

=====> BDD {email, nom de la commune, département}


## [OPÉRATION TIM](https://github.com/Mate2xo)
- *Envoyer les emails*

=====> (tester sur des BDDs en bois avec vos adresses emails)

=====> reprendre chaque colonne de ton CSV/JSON


```
Bonjour,
Je m'appelle [PRÉNOM], je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de [NOM_COMMUNE] veut changer le monde avec nous ?


Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80
```

## [OPÉRATION SONIA](https://github.com/Janus9375)
- *Petite relance Twitter*

=====> repasser sur chaque élément du CSV/JSON et ajouter une colonne supplémentaire avec le handle twitter (recherche avec mairie [NOM_COMMUNE] en prenant le premier résultat)

=====> follow les users concernés. Avec un compte genre "Apprendre à coder" c'est pas mal



## [OPÉRATION LAURIE](https://github.com/LaurieAnnieClemence)
- *Structure du dossier*

=====> utiliser Dotenv

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

-------------------------------------------------------------
