CREATE TABLE client (
    id_client INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom       VARCHAR(100) NOT NULL,
    telephone VARCHAR(20)
);

ALTER TABLE commande ADD COLUMN id_client INTEGER REFERENCES client(id_client);  -- NULL autorisé

INSERT INTO client (nom, telephone) VALUES
 ('Hery Andrianarisoa', '034 00 000 01'),
 ('Voahangy Rakotoarisoa', NULL);

UPDATE commande SET id_client = 1 WHERE id_commande = 1;
UPDATE commande SET id_client = 2 WHERE id_commande = 3;
-- la commande 2 reste sans client : client de passage