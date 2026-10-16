# Niveau 1-Fondamental (etapes 1 a 5)

## ETAPE 1-La carte

- * Creation du première table et insértion des sept plats du contexte. Vérification : `SELECT nom, prix FROM plat ORDER BY prix DESC;` qui affiche les plats du plus cher au moins cher 

- * Piège. INTEGER pour le prix : l'ariary n'a pas de centimes, et un entier évite les erreurs d'arrondi des flottants. L'identifiant est une clé artificielle auto-générée (id_plat), car le nom d'un plat peut changer ou être dupliqué : ce n'est pas un bon identifiant.

## ETAPE 2-Les categories 