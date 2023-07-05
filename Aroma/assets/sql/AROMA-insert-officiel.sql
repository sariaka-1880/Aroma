INSERT INTO typeproduit VALUES (default, 'Ressource', true);
INSERT INTO typeproduit VALUES (default, 'Produit plante', false);
INSERT INTO typeproduit VALUES (default, 'Produit recolte', true);
INSERT INTO typeproduit VALUES (default, 'Produit fini', true);

INSERT INTO typeproduit VALUES (default, 'Matieres premieres', true);


INSERT INTO unite VALUES (default, 'kg');
INSERT INTO unite VALUES (default, 'g');
INSERT INTO unite VALUES (default, 'mL');
INSERT INTO unite VALUES (default, 'L');
INSERT INTO unite VALUES (default, 'fleur');
INSERT INTO unite VALUES (default, 'sachet');

INSERT INTO unite VALUES (default, '% vol');

INSERT INTO produit VALUES (1, 'Ylang-ylang', 5, 2);
INSERT INTO produit VALUES (2, 'Ylang-ylang', 5, 3);
INSERT INTO produit VALUES (3, 'Geranium', 5, 2);
INSERT INTO produit VALUES (4, 'Geranium', 5, 3);
INSERT INTO produit VALUES (5, 'Engrais', 1, 1);
INSERT INTO produit VALUES (6, 'Semence', 2, 1);

INSERT INTO produit VALUES (7, 'Huile essentielle d''Ylang-ylang', 4, 4);
INSERT INTO produit VALUES (8, 'Huile essentielle de Geranium', 4, 4);
INSERT INTO produit VALUES (9, 'Parfum d''Ylang-ylang', 4, 4);
INSERT INTO produit VALUES (10, 'Parfum de Geranium', 4, 4);

INSERT INTO produit VALUES (11, 'Alcool', 7, 5);
INSERT INTO produit VALUES (12, 'Huile porteuse', 3, 5);
INSERT INTO produit VALUES (13, 'Solvant', 3, 5);
INSERT INTO produit VALUES (14, 'Fixateur', 3, 5);
INSERT INTO produit VALUES (15, 'Agrume', 2, 5);
INSERT INTO produit VALUES (16, 'Epice et aromate', 2, 5);
INSERT INTO produit VALUES (17, 'Bois', 2, 5);
INSERT INTO produit VALUES (18, 'Resine et gomme', 2, 5);
INSERT INTO produit VALUES (19, 'Muscs et ambre', 2, 5);

INSERT INTO planterecolte VALUES (1, 1, 2);
INSERT INTO planterecolte VALUES (2, 3, 4);

INSERT INTO ressourceplante VALUES (9, 5, 1, 90.00);
INSERT INTO ressourceplante VALUES (10, 5, 3, 92.00);
INSERT INTO ressourceplante VALUES (11, 6, 1, 1.00);
INSERT INTO ressourceplante VALUES (12, 6, 3, 2.00);


INSERT INTO fournisseur VALUES (1, 'Clean Cooking Madagascar', '+261 34 17 555 00');
INSERT INTO fournisseur VALUES (2, 'Aromeya', '+261 34 42 340 33');
INSERT INTO fournisseur VALUES (3, 'Chimidis', '020 22 346 27');
INSERT INTO fournisseur VALUES (4, 'Floribis', '+261 32 05 819 35');
INSERT INTO fournisseur VALUES (5, 'Pharmacie Hasimbola', '+261 34 20 259 50');


INSERT INTO typeactivite VALUES (1, 'Plantation');
INSERT INTO typeactivite VALUES (3, 'Recolte');

-- Mbola tsy dia mazava tsara sady je pense pas hoe mila donnée de test
-- INSERT INTO activite VALUES (1, 1, 1, '2023-01-01', '2023-01-10', '2023-05-25');
-- INSERT INTO activite VALUES (2, 3, 1, '2023-01-01', '2023-01-05', '2023-05-25');
-- INSERT INTO activite VALUES (5, 2, 3, '2023-03-12', '2023-03-30', '2023-05-25');
-- INSERT INTO activite VALUES (6, 4, 3, '2023-04-04', '2023-04-22', '2023-05-25');
-- INSERT INTO activite VALUES (7, 3, 1, '2023-06-07', '2023-06-08', '2023-06-07');
-- INSERT INTO activite VALUES (8, 2, 3, '2023-06-08', '2023-06-10', '2023-06-07');
-- INSERT INTO activite VALUES (9, 4, 3, '2023-06-08', '2023-06-09', '2023-06-07');

-- INSERT INTO mouvementproduit VALUES (1, 5, '2023-01-01', 2000, 0, 1000, '2024-12-31', 1);
-- INSERT INTO mouvementproduit VALUES (2, 6, '2023-01-02', 3000, 0, 1000, '2024-12-31', 2);
-- INSERT INTO mouvementproduit VALUES (3, 1, '2023-02-01', 4000, 0, 200, '2024-01-06', 3);
-- INSERT INTO mouvementproduit VALUES (4, 3, '2022-01-01', 5000, 0, 150, '2024-01-06', 4);
-- INSERT INTO mouvementproduit VALUES (5, 7, '2021-01-01', 6000, 0, 150, '2024-01-06', 5);
-- INSERT INTO mouvementproduit VALUES (6, 8, '2022-12-01', 7000, 0, 150, '2024-01-06', 1);
-- INSERT INTO mouvementproduit VALUES (7, 8, '2023-01-31', 8000, 0, 150, '2024-01-06', 2);
-- INSERT INTO mouvementproduit VALUES (8, 8, '2023-01-03', 9000, 0, 150, '2024-01-06', 3);
-- INSERT INTO mouvementproduit VALUES (9, 4, '2022-01-02', 11000, 0, 150, '2024-01-06', 5);
-- INSERT INTO mouvementproduit VALUES (10, 7, '2022-01-02', 12000, 0, 150, '2024-01-06', 1);
-- INSERT INTO mouvementproduit VALUES (11, 9, '2022-02-28', 13000, 0, 150, '2024-01-06', 2);
-- INSERT INTO mouvementproduit VALUES (12, 10, '2023-01-01', 14000, 0, 150, '2024-01-06', 3);
-- INSERT INTO mouvementproduit VALUES (13, 11, '2023-01-03', 15000, 0, 150, '2024-01-06', 4);
-- INSERT INTO mouvementproduit VALUES (14, 12, '2023-02-02', 16000, 0, 150, '2024-01-06', 5);
-- INSERT INTO mouvementproduit VALUES (15, 13, '2022-01-02', 17000, 0, 150, '2024-01-06', 1);
-- INSERT INTO mouvementproduit VALUES (16, 14, '2022-02-28', 18000, 0, 150, '2024-01-06', 2);
-- INSERT INTO mouvementproduit VALUES (17, 15, '2023-01-01', 19000, 0, 150, '2024-01-06', 3);
-- INSERT INTO mouvementproduit VALUES (18, 16, '2023-01-03', 20000, 0, 150, '2024-01-06', 4);
-- INSERT INTO mouvementproduit VALUES (19, 17, '2023-02-02', 21000, 0, 150, '2024-01-06', 5);
-- INSERT INTO mouvementproduit VALUES (20, 18, '2022-01-02', 22000, 0, 150, '2024-01-06', 1);
-- INSERT INTO mouvementproduit VALUES (21, 19, '2021-02-28', 23000, 0, 150, '2024-01-06', 2);
-- INSERT INTO mouvementproduit VALUES (22, 2, '2023-02-02', 10000, 0, 150, '2024-01-06', 4);


INSERT INTO mois (nom_mois) VALUES
  ('Janvier'),
  ('Février'),
  ('Mars'),
  ('Avril'),
  ('Mai'),
  ('Juin'),
  ('Juillet'),
  ('Août'),
  ('Septembre'),
  ('Octobre'),
  ('Novembre'),
  ('Décembre');
  
  
-- Ohatrany tsy sura hoe mila donnée prédéfinie ao am base
insert into report values(1, 1000000,  '2023/07/02 11:20:00'::timestamp);
insert into report values(2, 500000,  '2023/07/03 11:20:00'::timestamp);
insert into report values(3, 700000,  '2023/07/04 11:20:00'::timestamp);

INSERT INTO transaction (description, date_transaction, entree, sortie)
VALUES
  ('Achat de semences ylang-ylang', '2023-06-01', 100.00, 0),
  ('Vente d''huile essentielle ylang-ylang', '2023-06-02', 0, 75.50),
  ('Achat d''engrais ylang-ylang', '2023-06-03', 50.25, 0),
  ('Achat de semences géranium', '2023-06-04', 80.00, 0),
  ('Vente d''huile essentielle géranium', '2023-06-05', 0, 120.50),
  ('Achat d''engrais géranium', '2023-06-06', 60.75, 0);

insert into produitfinis_matieres_premieres values (7, 12, 11.11);
insert into produitfinis_matieres_premieres values (7, 13, 0.5);
insert into produitfinis_matieres_premieres values (7, 14, 1.2);
insert into produitfinis_matieres_premieres values (7, 15, 0.3);
insert into produitfinis_matieres_premieres values (7, 16, 0.7);
insert into produitfinis_matieres_premieres values (7, 17, 0.2);
insert into produitfinis_matieres_premieres values (7, 18, 0.4);
insert into produitfinis_matieres_premieres values (7, 19, 0.6);
insert into produitfinis_matieres_premieres values (8, 12, 1.5);
insert into produitfinis_matieres_premieres values (8, 13, 8);
insert into produitfinis_matieres_premieres values (8, 14, 1.2);
insert into produitfinis_matieres_premieres values (8, 15, 0.3);
insert into produitfinis_matieres_premieres values (8, 16, 0.7);
insert into produitfinis_matieres_premieres values (8, 17, 0.2);
insert into produitfinis_matieres_premieres values (8, 18, 0.4);
insert into produitfinis_matieres_premieres values (8, 19, 0.6);
insert into produitfinis_matieres_premieres values (9, 11, 7);
insert into produitfinis_matieres_premieres values (9, 12, 2);
insert into produitfinis_matieres_premieres values (9, 14, 0.3);
insert into produitfinis_matieres_premieres values (9, 15, 0.2);
insert into produitfinis_matieres_premieres values (9, 16, 0.1);
insert into produitfinis_matieres_premieres values (9, 17, 0.3);
insert into produitfinis_matieres_premieres values (9, 18, 0.1);
insert into produitfinis_matieres_premieres values (10, 11, 8);
insert into produitfinis_matieres_premieres values (10, 12, 2);
insert into produitfinis_matieres_premieres values (10, 14, 0.3);
insert into produitfinis_matieres_premieres values (10, 15, 0.2);
insert into produitfinis_matieres_premieres values (10, 16, 0.1);
insert into produitfinis_matieres_premieres values (10, 17, 0.3);
insert into produitfinis_matieres_premieres values (10, 18, 0.1);

INSERT INTO entrepot VALUES (1, 'Parfum Palace');
INSERT INTO entrepot VALUES (2, 'Fragrance Depot');
INSERT INTO entrepot VALUES (3, 'Scent Haven');
INSERT INTO entrepot VALUES (4, 'Perfume Warehouse');
INSERT INTO entrepot VALUES (5, 'Aroma Warehouse');

INSERT INTO vertu VALUES (1, 7, 'Relaxante : L''Ylang-ylang est connu pour ses propriétés apaisantes et relaxantes. Son parfum floral et sucré peut aider à réduire le stress, l''anxiété et favoriser la relaxation.');
INSERT INTO vertu VALUES (2, 7, 'Aphrodisiaque : L''huile essentielle d''Ylang-ylang est souvent utilisée comme aphrodisiaque naturel. Son parfum sensuel et son effet relaxant peuvent stimuler la libido et favoriser une ambiance romantique.');
INSERT INTO vertu VALUES (3, 7, 'Équilibrante hormonale : Elle est réputée pour aider à équilibrer les hormones et soulager les symptômes du syndrome prémenstruel (SPM) et des déséquilibres hormonaux chez les femmes.');
INSERT INTO vertu VALUES (4, 7, 'Soin de la peau et des cheveux : L''Ylang-ylang est utilisé dans les produits de soin de la peau et des cheveux en raison de ses propriétés hydratantes. Elle peut aider à maintenir l''équilibre de l''hydratation de la peau, favoriser une peau saine et apporter de la brillance aux cheveux.');
INSERT INTO vertu VALUES (5, 7, 'Réduction de la tension artérielle : Certaines études suggèrent que l''huile essentielle d''Ylang-ylang peut contribuer à réduire la tension artérielle, ce qui en fait une option intéressante pour la gestion du stress et de l''hypertension.');


INSERT INTO vertu VALUES (6, 8, 'Effet relaxant : Le géranium est souvent utilisé pour aider à réduire le stress, l''anxiété et favoriser la relaxation. Son parfum floral et doux peut avoir un effet apaisant sur le système nerveux.');
INSERT INTO vertu VALUES (7, 8, 'Équilibrant hormonal : L''huile essentielle de géranium est réputée pour son action équilibrante sur les hormones. Elle peut être utilisée pour soulager les symptômes associés au déséquilibre hormonal, tels que les sautes d''humeur, les troubles menstruels et les symptômes de la ménopause.');
INSERT INTO vertu VALUES (8, 8, 'Soin de la peau : Le géranium est souvent utilisé en cosmétique pour ses propriétés bénéfiques pour la peau. Il peut aider à équilibrer la production de sébum, ce qui en fait un bon choix pour les peaux grasses et à problèmes. Il peut également aider à réduire l''apparence des rides, des cicatrices et des taches sombres.');
INSERT INTO vertu VALUES (9, 8, 'Répulsif naturel : L''huile essentielle de géranium a des propriétés répulsives contre les insectes tels que les moustiques. Elle peut être utilisée seule ou en combinaison avec d''autres huiles essentielles pour fabriquer un répulsif naturel.');
INSERT INTO vertu VALUES (10, 8, 'Antiseptique : Le géranium possède des propriétés antiseptiques, ce qui signifie qu''il peut aider à prévenir les infections et favoriser la guérison des plaies mineures.');

INSERT INTO vertu VALUES (11, 9, 'Relaxation et réduction du stress : L''Ylang-Ylang est souvent utilisé pour ses propriétés apaisantes et relaxantes. Son parfum floral et exotique peut aider à calmer le système nerveux, réduire l''anxiété, la tension et le stress.');
INSERT INTO vertu VALUES (12, 9, 'Aphrodisiaque : Le parfum sensuel de l''Ylang-Ylang est réputé pour stimuler la libido et favoriser une atmosphère romantique. Il est souvent utilisé dans les produits de beauté et les parfums destinés à susciter l''attraction et l''intimité.');
INSERT INTO vertu VALUES (13, 9, 'Équilibrant émotionnel : L''Ylang-Ylang est considéré comme un équilibrant émotionnel, capable d''harmoniser les émotions et d''apporter une sensation de bien-être. Il peut aider à soulager la dépression, les sautes d''humeur et favoriser une sensation de calme et de positivité.');
INSERT INTO vertu VALUES (14, 9, 'Stimulant de l''énergie : Bien que l''Ylang-Ylang soit souvent utilisé pour ses propriétés relaxantes, il peut également agir comme un stimulant énergisant en aidant à revitaliser et à recharger le corps et l''esprit. Son parfum enivrant peut augmenter la vitalité et la concentration.');
INSERT INTO vertu VALUES (15, 9, 'Soulagement des maux de tête : Certaines personnes trouvent que l''odeur de l''Ylang-Ylang peut aider à soulager les maux de tête et les migraines. Son parfum agréable peut favoriser la détente et réduire la tension qui peut contribuer à ces inconforts.');

INSERT INTO vertu VALUES (16, 10, 'Effet apaisant : Le parfum du géranium est souvent utilisé pour son action apaisante et relaxante. Son odeur douce et florale peut aider à calmer les nerfs, soulager l''anxiété et favoriser la détente.');
INSERT INTO vertu VALUES (17, 10, 'Équilibrant émotionnel : Le parfum du géranium est réputé pour son potentiel à équilibrer les émotions. Il peut aider à stabiliser l''humeur, à réduire le stress et à promouvoir une sensation de bien-être général.');
INSERT INTO vertu VALUES (18, 10, 'Répulsif naturel : Tout comme l''huile essentielle de géranium, le parfum du géranium est connu pour son action répulsive contre les insectes, en particulier les moustiques. Il peut être utilisé comme alternative naturelle aux répulsifs chimiques.');
INSERT INTO vertu VALUES (19, 10, 'Parfum cosmétique : Le parfum du géranium est souvent utilisé dans l''industrie cosmétique pour sa senteur agréable. Il peut être utilisé dans la fabrication de parfums, de produits pour le bain et le corps, ainsi que dans les soins capillaires.');
INSERT INTO vertu VALUES (20, 10, 'Stimulant de l''énergie : Bien que le géranium soit généralement considéré comme apaisant, son parfum peut également avoir un effet stimulant sur l''énergie et la vitalité. Il peut aider à éveiller les sens et à favoriser la concentration.');


insert into image values(7, 'Huile Essentiel Ylang-Ylang1.png');
insert into image values(7, 'Huile Essentiel Ylang-Ylang2.png');
insert into image values(7, 'Huile Essentiel Ylang-Ylang3.png');
insert into image values(7, 'Huile Essentiel Ylang-Ylang4.png');
insert into image values(7, 'Huile Essentiel Ylang-Ylang5.png');

insert into image values(8, 'Huile Essentiel de Geranium1.png');
insert into image values(8, 'Huile Essentiel de Geranium2.png');
insert into image values(8, 'Huile Essentiel de Geranium3.png');
insert into image values(8, 'Huile Essentiel de Geranium4.png');
insert into image values(8, 'Huile Essentiel de Geranium5.png');

insert into image values(9, 'Parfum Ylang-Ylang1.png');
insert into image values(9, 'Parfum Ylang-Ylang2.png');
insert into image values(9, 'Parfum Ylang-Ylang3.png');
insert into image values(9, 'Parfum Ylang-Ylang4.png');
insert into image values(9, 'Parfum Ylang-Ylang5.png');

insert into image values(10, 'Parfum Geranium1.png');
insert into image values(10, 'Parfum Geranium2.png');
insert into image values(10, 'Parfum Geranium3.png');

-- Flacon d'huile : 10ml
-- Flacon parfum : 100ml

INSERT INTO prix VALUES (7, 11000, '2023-06-26');
INSERT INTO prix VALUES (7, 45000, '2023-06-27');
INSERT INTO prix VALUES (7, 50000, '2023-06-28');

INSERT INTO prix VALUES (8, 25000, '2023-06-22');
INSERT INTO prix VALUES (8, 35000, '2023-06-23');
INSERT INTO prix VALUES (8, 55000, '2023-06-24');
INSERT INTO prix VALUES (8, 60000, '2023-06-25');
INSERT INTO prix VALUES (8, 70000, '2023-06-26');
INSERT INTO prix VALUES (8, 75000, '2023-06-27');
INSERT INTO prix VALUES (8, 80000, '2023-06-28');

INSERT INTO prix VALUES (9, 65000, '2023-06-26');
INSERT INTO prix VALUES (9, 93000, '2023-06-27');
INSERT INTO prix VALUES (9, 118500, '2023-06-28');

INSERT INTO prix VALUES (10, 50000, '2023-06-24');
INSERT INTO prix VALUES (10, 63500, '2023-06-25');
INSERT INTO prix VALUES (10, 487000, '2023-06-26');
INSERT INTO prix VALUES (10, 507000, '2023-06-27');
INSERT INTO prix VALUES (10, 1987000, '2023-06-28');

INSERT INTO client VALUES (1, 'Rasoa', 'Andoharanofotsy', '0340443581', 0);
INSERT INTO client VALUES (2, 'Rabe', 'Tanjombato', '032096734', 1);
INSERT INTO client VALUES (3, 'Rakuten', 'Mahamasina', '0336541278', 0);

INSERT INTO facture VALUES (1, 3, '2023-02-10');
INSERT INTO facture VALUES (2, 1, '2023-03-24');

INSERT INTO facturefille( idfacture , idproduit , quantite , prix_unitaire ) VALUES (1, 7, 3, 35000);
INSERT INTO facturefille( idfacture , idproduit , quantite , prix_unitaire ) VALUES (1, 8, 2, 38000);
INSERT INTO facturefille( idfacture , idproduit , quantite , prix_unitaire ) VALUES (2, 10, 1, 60000);

INSERT INTO remise VALUES (1, 50, '2023-06-01', '2023-06-30', 9);
-- Alcool, Huile porteuse, Solvant, Fixateur, Agrume, Epice et aromate, Bois, Resine et gomme, Muscs et ambre

-- insert into production values(1, 1, 1, 50, '2023-06-01 22:23'::timestamp);
-- insert into production values(2, 1, 2, 30, '2023-06-01 22:23'::timestamp);
-- insert into production values(3, 1, 3, 20, '2023-06-01 22:23'::timestamp);
-- insert into production values(4, 2, 3, 30, '2023-06-01 22:23'::timestamp);

-- insert into production values(1, 1, 5);
-- insert into production values(2, 2, 6);
-- insert into production values(3, 3, 7);
-- insert into production values(4, 4, 8);
-- insert into production values(5, 1, 10);
-- insert into production values(6, 2, 11);
-- insert into production values(7, 3, 12);