CREATE TABLE commande (
    id_commande   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_commande TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE ligne_commande (
    id_commande INTEGER NOT NULL REFERENCES commande(id_commande),
    id_plat     INTEGER NOT NULL REFERENCES plat(id_plat),
    quantite    INTEGER NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_commande, id_plat)
);

INSERT INTO commande (date_commande) VALUES
 ('2026-10-12 12:15'), ('2026-10-12 12:40'), ('2026-10-13 12:20');

-- plats : 1 Romazava, 2 Ravitoto, 3 Akoho, 4 Mi sao, 5 Soupe, 6 Mofo gasy, 7 Ranon'ampango
INSERT INTO ligne_commande (id_commande, id_plat, quantite) VALUES
 (1, 1, 1), (1, 7, 2),
 (2, 4, 1), (2, 5, 1), (2, 6, 1),
 (3, 3, 2), (3, 7, 2);