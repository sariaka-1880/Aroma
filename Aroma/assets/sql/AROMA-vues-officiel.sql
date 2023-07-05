create or replace view v_produit_liste as select produit.idUnite, idProduit, nom_produit, nom_unite, nom_type_produit, TypeProduit.stockable, produit.idTypeProduit from produit join unite on unite.idUnite=produit.idUnite join TypeProduit on produit.idTypeProduit=TypeProduit.idTypeProduit;

create or replace view v_liste_plante as select * from v_produit_liste where idTypeProduit = 2;

create or replace view v_liste_recolte as select * from v_produit_liste where idTypeProduit = 3;

create or replace view v_liste_produit_finis as select * from v_produit_liste where idTypeProduit = 4; -- 28 juin

CREATE or replace VIEW v_liste_produit_intermediaire AS
 SELECT v_produit_liste.idunite,
    v_produit_liste.idproduit,
    v_produit_liste.nom_produit,
    v_produit_liste.nom_unite,
    v_produit_liste.nom_type_produit,
    v_produit_liste.stockable,
    v_produit_liste.idtypeproduit
   FROM v_produit_liste
  WHERE ((v_produit_liste.idtypeproduit = 2) OR (v_produit_liste.idtypeproduit = 3));

create or replace view v_liste_stock as select produit.idProduit as idRessource, nom_produit as nom_produit, nom_unite, coalesce(sum(quantite_en_plus)-sum(quantite_en_moins), 0) as quantite_restant, nom_type_produit, stockable from MouvementProduit right join v_produit_liste as produit on produit.idProduit=MouvementProduit.idProduit group by produit.idUnite, produit.idProduit, nom_produit, nom_type_produit, produit.nom_unite, stockable;

create or replace view v_liste_ressource as select * from v_liste_stock where nom_type_produit='Ressource';

create or replace view v_annee_actuelle as select extract(year from now()) as annee;

create or replace view v_mois_actuelle as select extract(month from now()) as mois;

-- Tsy tadidiko
create or replace view v_produit_recolte_mois_an as select Mouvementproduit.idProduit, coalesce(sum(quantite_en_plus)) as total, extract(month from date) as Mois, extract(year from date) as Annee from MouvementProduit right join produit on produit.idproduit=Mouvementproduit.idproduit where idTypeProduit=3 group by Mouvementproduit.idproduit, Mois, Annee;

create or replace view v_liste_annee as select distinct extract(year from MouvementProduit.date) as annee from MouvementProduit;


create or replace view v_all_produit_recolte_mois_annee_possible as select idproduit, id, v_liste_annee.annee,nom_mois from v_liste_recolte cross join mois, v_liste_annee;

create or replace view v_total_recolte_mois_an as select v2.idproduit, coalesce(total, 0) as total, v2.nom_mois, v2.id, v2.annee from v_produit_recolte_mois_an v1 right join v_all_produit_recolte_mois_annee_possible v2 on v1.mois=v2.id and v2.annee = v1.annee;

create or replace view v_total_plante_par_mois as select v_liste_plante.idproduit, nom_produit, extract(month from MouvementProduit.date) as mois, extract(year from MouvementProduit.date) as annee, coalesce(sum(quantite_en_plus), 0) as quantite from v_liste_plante left join MouvementProduit on MouvementProduit.idProduit=v_liste_plante.idProduit group by extract(month from MouvementProduit.date), v_liste_plante.idproduit, nom_produit, MouvementProduit.date;

create or replace view v_all_produit_mois_annee_possible as select * from v_liste_plante cross join mois, v_liste_annee;

create or replace view v_total_plante_pour_tout_mois as select  v_all_produit_mois_annee_possible.nom_produit, v_all_produit_mois_annee_possible.id as mois, v_all_produit_mois_annee_possible.nom_mois, v_all_produit_mois_annee_possible.annee, COALESCE(v_total_plante_par_mois.quantite, 0) as quantite, v_all_produit_mois_annee_possible.idProduit from v_all_produit_mois_annee_possible left join v_total_plante_par_mois on  v_total_plante_par_mois.idProduit=v_all_produit_mois_annee_possible.idProduit and   v_total_plante_par_mois.mois =v_all_produit_mois_annee_possible.id  and   v_total_plante_par_mois.annee=v_all_produit_mois_annee_possible.annee;

create or replace view v_total_recolte_mois_now as select * from v_total_recolte_mois_an where annee = extract(year from now()) and id = extract(month from now());

create or replace view v_total_plante_mois_actuelle as select idProduit, nom_produit, sum(quantite) as quantite from v_total_plante_pour_tout_mois where mois = (select mois from v_mois_actuelle) and annee=(select annee from v_annee_actuelle) group by idProduit, nom_produit;

create or replace view v_recolte_annee  as 
select idproduit, coalesce(sum(total), 0) as total, annee from v_total_recolte_mois_an where annee=(select extract(year from now())) group by annee, idproduit;

create or replace view v_recolte_annee_derniere  as 
select idproduit, coalesce(sum(total), 0) as total, annee from v_total_recolte_mois_an where annee=(select extract(year from now()) -1) group by annee, idproduit;

create or replace view v_total_plante_annee_actuelle as select idProduit, nom_produit, sum(quantite) as quantite from v_total_plante_pour_tout_mois where annee = (select annee from v_annee_actuelle) group by idProduit, nom_produit;

create or replace view v_total_recolte_mois_precedent as select * from v_total_recolte_mois_an where annee=(SELECT EXTRACT(YEAR FROM CURRENT_DATE) - CASE WHEN EXTRACT(MONTH FROM CURRENT_DATE) = 1 THEN 1 ELSE 0 END) and id=extract(month from now() - INTERVAL '1 month');

create or replace view v_hausse_mois_precedent as
select 
v_total_recolte_mois_now.total - (v_total_recolte_mois_precedent.total)as hausse_recolte_mois,v_total_recolte_mois_now.idproduit
from v_total_recolte_mois_now
join v_total_recolte_mois_precedent
    on v_total_recolte_mois_precedent.idproduit  = v_total_recolte_mois_now.idproduit;

create or replace view v_total_recolte_mois_precedent as select * from v_total_recolte_mois_an where annee=(SELECT EXTRACT(YEAR FROM CURRENT_DATE) - CASE WHEN EXTRACT(MONTH FROM CURRENT_DATE) = 1 THEN 1 ELSE 0 END) and id=extract(month from now() - INTERVAL '1 month');

create or replace view v_hausse_recolte_annee_derniere as 
select v1.idproduit, v1.total - coalesce(v2.total ,0) as hausse_annee_derniere
from v_recolte_annee v1 left join v_recolte_annee_derniere v2 on v1.idproduit = v2.idproduit;


create or replace view v_total_plante_mois_avant as select idProduit, nom_produit, sum(quantite) as quantite from v_total_plante_pour_tout_mois where mois = (select extract(month from now() - INTERVAL '1 month')) and annee=(SELECT EXTRACT(YEAR FROM CURRENT_DATE) - CASE WHEN EXTRACT(MONTH FROM CURRENT_DATE) = 1 THEN 1 ELSE 0 END) group by idProduit, nom_produit;

create or replace view v_hausse_mois_dernier as select v_total_plante_mois_actuelle.idProduit, v_total_plante_mois_actuelle.quantite-v_total_plante_mois_avant.quantite as hausse from v_total_plante_mois_actuelle join v_total_plante_mois_avant on v_total_plante_mois_avant.idProduit=v_total_plante_mois_actuelle.idProduit;

create or replace view v_total_plante_annee_derniere as select idProduit, nom_produit, sum(quantite) as quantite from v_total_plante_pour_tout_mois where annee = (select extract(year from now() - INTERVAL '1 year')) group by idProduit, nom_produit;

create or replace view v_hausse_annee_derniere as select v_total_plante_annee_actuelle.idproduit,v_total_plante_annee_actuelle.quantite-coalesce(v_total_plante_annee_derniere.quantite, 0) as hAnneeDerniere from v_total_plante_annee_derniere right join v_total_plante_annee_actuelle on v_total_plante_annee_actuelle.idProduit=v_total_plante_annee_derniere.idProduit;

--liste des activites
CREATE or replace VIEW v_activite AS
 SELECT activite.datedebutactivite,
    activite.datefinactivite,
    typeactivite.description,
    (((typeactivite.description)::text || ' - '::text) || (produit.nom_produit)::text) AS intitule
   FROM ((activite
     JOIN typeactivite ON ((typeactivite.idtypeactivite = activite.idactivite)))
     JOIN produit ON ((produit.idproduit = activite.idplante)))
  ORDER BY activite.datedebutactivite;
 
create or replace view v_premiere_transaction as
select 
coalesce(min(date_transaction),now()) as date_min from transaction;

create or replace view v_dernier_report as SELECT valeur, date_report FROM report WHERE EXISTS (SELECT 1 FROM report) and date_report=(select max(date_report) from report) UNION ALL SELECT 0, (select date_min from v_premiere_transaction) WHERE NOT EXISTS (SELECT 1 FROM report);

create or replace view v_caisse_now as select valeur+(select coalesce(sum(sortie-entree), 0) from transaction where date_transaction>(select date_report from v_dernier_report)) as valeur from v_dernier_report;

create or replace view v_produits_primaires as
  select * from v_produit_liste where idtypeproduit=1 or idtypeproduit=5;

create or replace view v_dernier_prix as
  SELECT p.idProduit, p.prix, p.date_insertion FROM prix p
  JOIN (
      SELECT idProduit, MAX(date_insertion) AS max_date
      FROM prix
      GROUP BY idProduit
  ) p2 ON p.idProduit = p2.idProduit AND p.date_insertion = p2.max_date
  ORDER BY p.date_insertion DESC;


create or replace view v_liste_distributeurs as
  select * from client where est_distributeur=0;



create or replace view v_production_produit_finis as select production.id_production, production.id_entrepot, v_mouvement_produit_finis.*from v_mouvement_produit_finis left join production on production.idMouvementProduit=v_mouvement_produit_finis.idMouvementProduit;

create or replace view v_production as SELECT e.identrepot, e.nomentrepot, p.idProduit, p.nom_produit, COALESCE(sum(mp.quantite_en_plus), 0) AS quantite_produite, COALESCE(mp.date, NOW()) AS date
FROM entrepot e
CROSS JOIN produit p
LEFT JOIN production pd ON e.identrepot = pd.id_entrepot
LEFT JOIN MouvementProduit mp ON p.idProduit = mp.idProduit AND pd.idMouvementProduit = mp.idMouvementProduit
JOIN TypeProduit tp ON p.idTypeProduit = tp.idTypeProduit
WHERE tp.idTypeProduit = 4 group by e.identrepot, e.nomentrepot, p.idProduit, p.nom_produit, mp.date;

create or replace view v_production_date as select v_production.*, extract(day from date) as jour, mois.nom_mois, extract(year from date) as annee from v_production join mois on mois.id=extract(month from date);

create or replace view v_rendement_jour as select nomentrepot, nom_produit, avg(quantite_produite) as rendement_jour, jour, nom_mois, annee from v_production_date group by nomentrepot, nom_produit, jour, nom_mois, annee;

create or replace view v_rendement_mois as select nomentrepot, nom_produit, avg(rendement_jour) as rendement_mois, nom_mois, annee from v_rendement_jour group by nomentrepot, nom_produit, nom_mois, annee;

create or replace view v_annee_transaction as(
    select 
    distinct(extract(year from date_transaction)) as annee
    from transaction
);
create or replace view v_mois_annee_transaction as (
    select mois.id,v_annee_transaction.annee from mois cross join v_annee_transaction

);
create or replace view v_benefice as (  
    select 
    coalesce(sum(sortie - entree),0) as benefice, v_mois_annee_transaction.id as mois, v_mois_annee_transaction.annee
    from transaction
    right join v_mois_annee_transaction
        on v_mois_annee_transaction.id = extract(month from date_transaction) 
        and v_mois_annee_transaction.annee = extract(year from date_transaction) 
    group by v_mois_annee_transaction.id, v_mois_annee_transaction.annee
);

create or replace view v_produit_fini as 
    select p.* , nom_type_produit , stockable , nom_unite from produit as p 
    natural join typeproduit as tp
    join unite as u  on  p.idunite = u.idunite
    where  p.idtypeproduit = 4
;

CREATE or replace VIEW public.v_liste_stock AS
 SELECT produit.idproduit AS idressource,
    produit.nom_produit,
    produit.nom_unite,
    coalesce((sum(mouvementproduit.quantite_en_plus) - sum(mouvementproduit.quantite_en_moins)),0) AS quantite_restant,
    produit.nom_type_produit,
    produit.stockable
   FROM (public.mouvementproduit
    right JOIN public.v_produit_liste produit ON ((produit.idproduit = mouvementproduit.idproduit)))
  GROUP BY produit.idunite, produit.idproduit, produit.nom_produit, produit.nom_type_produit, produit.nom_unite, produit.stockable;

create or replace view v_mouvement_produit_finis as select mouvementproduit.idMouvementProduit, v_produit_fini.idproduit, v_produit_fini.nom_produit, coalesce(mouvementproduit.date, now()) as date_production, coalesce(mouvementproduit.quantite_en_plus, 0) as quantite_produite from v_produit_fini left join mouvementproduit on mouvementproduit.idProduit=v_produit_fini.idproduit;

create or replace view v_production_produit_finis as select production.id_production, production.id_entrepot, v_mouvement_produit_finis.*from v_mouvement_produit_finis left join production on production.idMouvementProduit=v_mouvement_produit_finis.idMouvementProduit;

create or replace view v_production as SELECT e.identrepot, e.nomentrepot, p.idProduit, p.nom_produit, COALESCE(sum(mp.quantite_en_plus), 0) AS quantite_produite, COALESCE(mp.date, NOW()) AS date
FROM entrepot e
CROSS JOIN produit p
LEFT JOIN production pd ON e.identrepot = pd.id_entrepot
LEFT JOIN MouvementProduit mp ON p.idProduit = mp.idProduit AND pd.idMouvementProduit = mp.idMouvementProduit
JOIN TypeProduit tp ON p.idTypeProduit = tp.idTypeProduit
WHERE tp.idTypeProduit = 4 group by e.identrepot, e.nomentrepot, p.idProduit, p.nom_produit, mp.date;

create or replace view v_production_date as select v_production.*, extract(day from date) as jour, mois.nom_mois, extract(year from date) as annee from v_production join mois on mois.id=extract(month from date);

create or replace view v_rendement_jour as select nomentrepot, nom_produit, avg(quantite_produite) as rendement_jour, jour, nom_mois, annee from v_production_date group by nomentrepot, nom_produit, jour, nom_mois, annee;

create or replace view v_rendement_mois as select nomentrepot, nom_produit, avg(rendement_jour) as rendement_mois, nom_mois, annee from v_rendement_jour group by nomentrepot, nom_produit, nom_mois, annee;

create or replace view v_rendement_mois_entrepot as 
    select  nom_produit ,nom_mois ,annee , avg( rendement_mois ) as rendement_mois
    from v_rendement_mois
    group by nom_produit , nom_mois , annee;

create or replace view v_rendement_mois_now as 
    select * 
    from v_rendement_mois_entrepot 
    where annee = ( extract (year from  now()));

create or replace view v_all_possibilities_rendement as 
    SELECT t1.nom_produit, t2.nom_mois
    FROM (SELECT DISTINCT(nom_produit) FROM v_rendement_mois_entrepot) t1
        CROSS JOIN (SELECT nom_mois FROM mois) t2;


create or replace view v_rendement_mois_entrepot_all as
    select      m.nom_produit , m.nom_mois , annee ,     rendement_mois  
    from v_rendement_mois_now as eme
        full outer  join v_all_possibilities_rendement as m on m.nom_mois = eme.nom_mois
        and m.nom_produit = eme.nom_produit
    ;
  create or replace view v_rendement_produit_fini_par_jour as   
    select 
        pf.* , coalesce(moyenne_production , 0) as  moyenne_production
    from v_rendement_produit_fini as rpf 
    right outer join v_produit_fini as pf 
        on rpf.idproduit = pf.idproduit;

create or replace view v_mouvementproduit_entrepot as
    select * from 
    mouvementproduit as mp
    natural join mouvementproduit_entrepot as mpe;

create or replace view v_production  as
    select * from 
    v_mouvementproduit_entrepot as me
    where identrepot is not null 
;

create or replace view v_rendement_produit_fini as 
    SELECT
        idproduit,
        (SUM(quantite_produite) / COUNT(identrepot)) AS moyenne_production
    FROM v_production
    WHERE date = NOW()::date
    GROUP BY idproduit;

create or replace view v_produits as 
  select 
    produit.idproduit, 
    produit.nom_produit, 
    vertu.vertu,  
    prix.prix, 
    prix.date_insertion
  from produit
  inner join vertu on vertu.idproduit = produit.idproduit
  inner join (
    select idproduit, max(date_insertion) as max_date_insertion
    from prix
    group by idproduit
  ) max_prix on max_prix.idproduit = produit.idproduit
  inner join prix on prix.idproduit = produit.idproduit and max_prix.max_date_insertion = prix.date_insertion
  where produit.idtypeproduit = 4;
