SELECT nom, prix FROM plat ORDER BY prix DESC;

SELECT c.libelle, COUNT(p.id_plat) AS nb_plats
FROM categorie c
LEFT JOIN plat p ON p.id_categorie = c.id_categorie
GROUP BY c.id_categorie, c.libelle
ORDER BY c.libelle;

SELECT c.id_commande, c.date_commande, SUM(lc.quantite * p.prix) AS total_ar
FROM commande c
JOIN ligne_commande lc ON lc.id_commande = c.id_commande
JOIN plat p ON p.id_plat = lc.id_plat
GROUP BY c.id_commande, c.date_commande
ORDER BY c.id_commande;

SELECT c.id_commande, c.date_commande,
       COALESCE(cl.nom, 'client de passage') AS client
FROM commande c
LEFT JOIN client cl ON cl.id_client = c.id_client
ORDER BY c.id_commande;

SELECT s.nom,
       COUNT(DISTINCT c.id_commande)           AS nb_commandes,
       COALESCE(SUM(lc.quantite * p.prix), 0)  AS chiffre_affaires_ar
FROM serveur s
LEFT JOIN commande c        ON c.id_serveur = s.id_serveur
LEFT JOIN ligne_commande lc ON lc.id_commande = c.id_commande
LEFT JOIN plat p            ON p.id_plat = lc.id_plat
GROUP BY s.id_serveur, s.nom;

