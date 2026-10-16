# Réponses aux questions « Piège » : niveau 1

## Étape 1 : La carte

**Quel type pour le prix ? Quel identifiant ?**

`INTEGER` : l'ariary n'a pas de centimes, et un entier évite les erreurs d'arrondi des nombres flottants. L'identifiant est une clé artificielle auto-générée (`id_plat`), car le nom d'un plat peut changer ou être dupliqué : ce n'est pas un bon identifiant.

## Étape 2 : Les catégories

**Pourquoi pas une colonne `categorie VARCHAR(50)` dans la table des plats ?**

Rien n'empêche « Soupe », « soupe » et « Soupes » de coexister, et les regroupements deviennent faux. Renommer une catégorie oblige à modifier toutes les lignes de plats. Une catégorie sans plat n'existe pas, donc la demande « y compris les catégories sans plat » est impossible à satisfaire.

## Étape 3 : Les commandes

**Où placer la quantité ?**

Dans la table d'association `LIGNE_COMMANDE`. La quantité dépend du couple (commande, plat) : ce n'est une propriété ni du plat seul ni de la commande seule.

## Étape 4 : Les habitués

**La clé étrangère est-elle `NOT NULL` ? Quelle jointure ?**

Non : la plupart des clients sont de passage, donc `id_client` doit pouvoir rester `NULL`. Il faut une `LEFT JOIN` depuis `commande`, car une `INNER JOIN` ferait disparaître les commandes sans client.

## Étape 5 : Serveurs et tables

**Une table de la salle et une commande : pourquoi deux choses différentes ? Pourquoi le nom `table` pose-t-il problème ?**

Une table de la salle est un objet physique permanent, réutilisé à chaque service, alors qu'une commande est un événement daté. Une même table reçoit donc plusieurs commandes au fil du temps (relation 1-N), et la table est facultative sur la commande (plats à emporter). `table` est un mot réservé du SQL : il ne peut pas servir de nom de table sans guillemets, d'où `table_salle`.
