Migration des données
=====================

Contexte
--------

Le site LinuxFr.org tourne actuellement avec le moteur templeet, mais une réécriture en Rails arrive. Il va donc falloir migrer les données de l'un vers l'autre, et ce n'est pas un mince boulot.


Le schéma Templeet
------------------

Légende :
* **?** : je ne sais pas encore
* X : ces données ne seront pas importées car elles sont considérées comme inutiles
* O : ces données seront importées

Les tables :
* **?** `avis`
* X `board` : les messages dans les tribunes ont une durée de vie limitée, et ne seront pas importés.
* **?** `board_denied` : il y a actuellement 19 interdictions de tribune
* O `comments`
* **?** `comments_scored_user`
* **?** `commentsnew`
* **?** `contents_scored`
* O `forums_data` : à importer dans `posts`
* O `forums_group` : à importer dans `forums`
* O `interest` : à importer dans `nodes`
* O `interviews` : à importer dans `interviews`
* **?** `lang` : à mettre dans le dictionnaire ?
* X `locks`
* **?** `messages` : pour le moment, nous n'avons pas de messagerie, et de toute façon, les messages ont une durée de vie limitée
* **?** `moderator_last` : à importer pour les stats (savoir qui a été modérateur dans le passé) ?
* O `news` : il faut bien entendu importer les dépêches
* O `news_attachements` : les secondes parties des dépêches
* O `news_author` : les auteurs de dépêches (pas toujours authentifiés)
* **?** `news_history` : est-ce utile d'importer les modifications sur les dépêches ?
* O `news_moderated` : on importe seulement une modération par dépêche
* O `news_urls` : les liens des dépêches
* O `poll_answers` : les propositions de réponse aux sondages
* X `poll_ip` : cette table est de toute façon vidée une fois par nuit
* O `poll_questions` : les questions des sondages
* X `prizes` : ce sont uniquement les prix du mois courant, et il n'y a rien de prévu pour utiliser ces infos sur le nouveau site
* O `sections` : les sections des dépêches
* X `sessions` : on ne pourra rien en faire
* X `sig` : visiblement, cette table ne sert pas à grand chose
* X `tag` : cette table ne servait pas
* X `tagmap` : idem
* X `tagvote` : idem
* O `topics` : les sujets des dépêches
* **?** `tracker` : est-ce que l'on purge le tracker ? Les entrées du suivi ne seront plus valides, mais souhaite-t-on conserver un historique ?
* **?** `tracker_category` : est-ce que l'on importe ces catégories ou on en crée de nouvelles plus en adéquation avec la nouvelle version ?
* **?** `tribune` : quelle différence par rapport à la table `board` ?
* **?** `urls_avgtime` : grosse table, mais elle sert à quoi ? stats pour les admins uniquement ?
* O `users` : les utilisateurs ne vont pas être contents si on n'importe pas leurs comptes (attention au mot de passe)
* X `users_boxes` : ça n'existe plus sur le nouveau site
* O `users_journal` : les journaux
* **?** `users_journal_recent` : doublons des journaux ?
* **?** `users_karma` : on n'a pas encore de karma sur le nouveau site
* **?** `users_karma_archive` : idem
* **?** `users_lastseen` : est-ce intéressant ?
* **?** `users_personnalboxes` : ça n'existe plus sur le nouveau site, mais il faudrait peut être fournir un moyen aux utilisateurs de récupérer ça
* X `users_rdf`
* **?** `users_tempo` : doublons des comptes utilisateurs ?


En pratique
-----------

$ cp config.yml{.sample,} && vim config.yml

$ mysql -u root
mysql> CREATE DATABASE linuxfr_templeet;
mysql> use linuxfr_templeet;
mysql> source linuxfr-daily.dump;
(attendre un bon moment)

$ ./import.rb

