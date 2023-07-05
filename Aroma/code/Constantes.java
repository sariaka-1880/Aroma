package utils;

public class Constantes {
    
    public static final String username="postgres";
    public static final String database="aroma";
    public static final String password="sariaka26";

    public static final String col_id_produit="idproduit";
    public static final String col_nom_produit="nom_produit";

    public static final String col_id_type="idtype";
    public static final String col_id_type_produit="idtypeproduit";
    public static final String col_nom_type="nom_type_produit";

    public static final String col_id_unite="idunite";
    public static final String col_nom_unite="nom_unite";

    public static final String col_id_fournisseur="idfournisseur";
    public static final String col_description_fournisseur="description";
    public static final String col_contact_fournisseur="contact";

    public static final String col_id_produit_intermediaire="idplante";
    public static final String col_id_ressource="idressource";

    public static final String col_quantite_recette="quantite";
    public static final String col_quantite_restant="quantite_restant"; 

    public static final String col_valeur_caisse="valeur";

    public static final String col_id_report="id_report";
    public static final String col_valeur_report="valeur";
    public static final String col_date_report="date_report";

    public static final String col_numero_transaction="numero_transaction";
    public static final String col_description_transaction="description";
    public static final String col_entree_transaction="entree";
    public static final String col_sortie_transaction="sortie";
    public static final String col_date_transaction="date_transaction";

    public static final String view_ressource="v_liste_ressource";
    public static final String view_produitIntermediaire="v_liste_produit_intermediaire";
    public static final String view_stock="v_liste_stock";
    public static final String view_caisse_now="v_caisse_now";
    public static final String view_dernier_report="v_dernier_report";

    public static final String table_mouvement_produit="mouvementproduit";
    public static final String table_fournisseur="fournisseur";
    public static final String table_recette="ressourceplante";
    public static final String table_report="report";
    public static final String table_transaction="transaction";

    //eto
    public static final String view_rendement_produit_fini_par_jour="v_rendement_produit_fini_par_jour";
    //tiavina
    public static final String table_produitfinis_matieres_premieres = "produitfinis_matieres_premieres ";
    public static final String col_id_matieres_premieres = "idmatiere_premiere";
    public static final String col_id_produit_fini = "idproduit_fini";
    public static final String col_quantite_utile = "quantite";
    public static final String table_produit = "produit";
    public static final String table_entrepot="entrepot";
    public static final String col_id_entrepot = "identrepot";
    public static final String col_nom_entrepot = "nomentrepot";
    public static final String view_produit_fini = "v_produit_fini";
}
