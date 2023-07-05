CREATE TABLE TypeProduit (
    idTypeProduit SERIAL NOT NULL,
    nom_type_produit varchar NOT NULL,
    stockable boolean,
    PRIMARY KEY (idTypeProduit)
);

CREATE TABLE Unite (
    idUnite SERIAL NOT NULL,
    nom_unite varchar NOT NULL,
    PRIMARY KEY (idUnite)
);


CREATE TABLE Produit (
    idProduit SERIAL NOT NULL,
    nom_produit varchar NOT NULL,
    idUnite integer NOT NULL,
    idTypeProduit integer NOT NULL,
    PRIMARY KEY (idProduit),
    FOREIGN KEY (idUnite) REFERENCES Unite (idUnite),
    FOREIGN KEY (idTypeProduit) REFERENCES TypeProduit (idTypeProduit)
);

create table planteRecolte (
    idPlanteRecolte serial primary key,
    idPlante int REFERENCES produit(idProduit),
    idRecolte int REFERENCES produit(idProduit)
);

CREATE TABLE RessourcePlante (
    idRessourcePlante SERIAL PRIMARY key,
    idRessource integer NOT NULL,
    idPlante integer NOT NULL,
    quantite numeric(19, 2),
    FOREIGN KEY (idRessource) REFERENCES Produit (idProduit),
    FOREIGN KEY (idPlante) REFERENCES Produit (idProduit)
);

CREATE TABLE Fournisseur (
    idFournisseur SERIAL NOT NULL,
    description text NOT NULL,
    contact varchar NOT NULL UNIQUE,
    PRIMARY KEY (idFournisseur)
);

CREATE TABLE TypeActivite (
    idTypeActivite SERIAL NOT NULL,
    description varchar NOT NULL UNIQUE,
    PRIMARY KEY (idTypeActivite)
);

CREATE TABLE Activite (
    idActivite SERIAL primary key,
    idPlante integer NOT NULL,
    idTypeActivite integer NOT NULL,
    dateDebutActivite date NOT NULL,
    dateFinActivite date,
    date_insertion date,
    FOREIGN KEY (idPlante) REFERENCES Produit (idProduit),
    FOREIGN KEY (idTypeActivite) REFERENCES TypeActivite (idTypeActivite)
);


CREATE TABLE MouvementProduit (
    idMouvementProduit SERIAL,
    idProduit integer NOT NULL,
    date date NOT NULL,
    quantite_en_plus numeric(19, 2) DEFAULT 0 NOT NULL,
    quantite_en_moins numeric(19, 2) DEFAULT 0 NOT NULL,
    prixAchat numeric,
    datePeremption date,
    idFournisseur integer,
    PRIMARY KEY (idMouvementProduit),
    FOREIGN KEY (idProduit) REFERENCES Produit (idProduit),
    FOREIGN KEY (idFournisseur) REFERENCES Fournisseur (idFournisseur)
);

CREATE TABLE mois (
  id SERIAL PRIMARY KEY,
  nom_mois VARCHAR NOT NULL
);

create table report(
    id_report serial primary key, 
    valeur numeric, 
    date_report timestamp default now()
);

create table transaction(
    numero_transaction serial primary key, 
    description text,
    date_transaction timestamp default now(),
    entree numeric, 
    sortie numeric
);

create table produitfinis_matieres_premieres(
    idproduit_fini integer, 
    idmatiere_premiere integer,
    quantite numeric,
    FOREIGN KEY (idproduit_fini) REFERENCES Produit (idProduit),
    FOREIGN KEY (idmatiere_premiere) REFERENCES Produit (idProduit)
);

CREATE TABLE entrepot (
  identrepot SERIAL PRIMARY KEY,
  nomentrepot VARCHAR NOT NULL
);

CREATE TABLE vertu (
    id_vertu serial primary key,
    idProduit   integer NOT NULL,
    vertu       text NOT NULL,
    FOREIGN KEY (idProduit) REFERENCES Produit (idProduit)
);

CREATE TABLE image (
    idProduit   integer NOT NULL,
    image       varchar NOT NULL,
    FOREIGN KEY (idProduit) REFERENCES Produit (idProduit)
);

CREATE TABLE prix (
    idProduit   integer NOT NULL,
    prix        numeric NOT NULL,
    date_insertion  date,
    FOREIGN KEY (idProduit) REFERENCES Produit (idProduit)
);

CREATE TABLE client (
    idclient    serial primary key,
    nom         varchar NOT NULL,
    adresse     varchar,
    numero      varchar,
    est_distributeur    integer
);

CREATE TABLE facture (
    idfacture   serial primary key,
    idclient    int references client(idclient),
    date        timestamp,
    FOREIGN KEY (idclient) REFERENCES client (idclient)
);

CREATE TABLE facturefille (
    id_facture_fille serial not null primary key,
    idfacture   int references facture(idfacture),
    idproduit   int references produit(idproduit),
    quantite    numeric NOT NULL,
    prix_unitaire   numeric NOT NULL
);

CREATE TABLE remise (
    idremise    serial primary key,
    valeur      numeric NOT NULL,
    date_debut  date,
    date_fin    date,
    idproduit   integer,
    FOREIGN KEY (idproduit) REFERENCES produit (idproduit)
);

create table mouvementproduit_entrepot(
    idmouvementproduit integer references mouvementproduit( idmouvementproduit ),
    identrepot integer references entrepot(identrepot)
);

create table production(
    id_production serial primary key,
    id_entrepot int references entrepot(identrepot),
    idMouvementProduit int REFERENCES MouvementProduit(idMouvementProduit)
);