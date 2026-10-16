# Schéma relationnel : la gargote de Rado

Notation : clé primaire en **gras**, clé étrangère précédée de `#`, attribut facultatif suivi de `?`.
Pour une clé primaire composée, tous les attributs sont en gras.

---

## Étape 1 : La carte

```
PLAT(**id_plat**, nom, prix)   (nouveau)
```

---

## Étape 2 : Les catégories

```
CATEGORIE(**id_categorie**, libelle)   (nouveau)
PLAT(**id_plat**, nom, prix, #id_categorie)   (modifié)
```

---

## Étape 3 : Les commandes

```
CATEGORIE(**id_categorie**, libelle)
PLAT(**id_plat**, nom, prix, #id_categorie)
COMMANDE(**id_commande**, date_commande)   (nouveau)
LIGNE_COMMANDE(**#id_commande**, **#id_plat**, quantite)   (nouveau)
```

---

## Étape 4 : Les habitués

```
CATEGORIE(**id_categorie**, libelle)
PLAT(**id_plat**, nom, prix, #id_categorie)
CLIENT(**id_client**, nom, telephone?)   (nouveau)
COMMANDE(**id_commande**, date_commande, #id_client?)   (modifié)
LIGNE_COMMANDE(**#id_commande**, **#id_plat**, quantite)
```

---

## Étape 5 : Serveurs et tables

```
CATEGORIE(**id_categorie**, libelle)
PLAT(**id_plat**, nom, prix, #id_categorie)
CLIENT(**id_client**, nom, telephone?)
SERVEUR(**id_serveur**, nom)   (nouveau)
TABLE_SALLE(**id_table**, numero)   (nouveau)
COMMANDE(**id_commande**, date_commande, #id_client?, #id_serveur, #id_table?)   (modifié)
LIGNE_COMMANDE(**#id_commande**, **#id_plat**, quantite)
```