CREATE TABLE serveur (
    id_serveur INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom        VARCHAR(100) NOT NULL
);

CREATE TABLE table_salle (
    id_table INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero   INTEGER NOT NULL UNIQUE
);

INSERT INTO serveur (nom) VALUES ('Njaka Rakoto'), ('Lalao Rasoa');
INSERT INTO table_salle (numero) SELECT generate_series(1, 8);

-- colonnes d'abord facultatives (des commandes existent déjà)
ALTER TABLE commande ADD COLUMN id_serveur INTEGER REFERENCES serveur(id_serveur);
ALTER TABLE commande ADD COLUMN id_table   INTEGER REFERENCES table_salle(id_table);  -- reste NULL pour l'emporter

UPDATE commande SET id_serveur = 1, id_table = 3    WHERE id_commande = 1;
UPDATE commande SET id_serveur = 2, id_table = 5    WHERE id_commande = 2;
UPDATE commande SET id_serveur = 1, id_table = NULL WHERE id_commande = 3;  -- à emporter

ALTER TABLE commande ALTER COLUMN id_serveur SET NOT NULL;