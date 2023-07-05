package assets;

import java.util.HashMap;

public class StatistiqueProduit {
    Produit produit;
    HashMap<String,Double> quantite_mois;

    public StatistiqueProduit(String nom_produit , HashMap<String,Double> quantite_mois){
        this.produit = new Produit(nom_produit);
        setQuantite_mois(quantite_mois);
    }

    public Produit getProduit() {
        return produit;
    }
    public void setProduit(Produit produit) {
        this.produit = produit;
    }

    public HashMap<String, Double> getQuantite_mois() {
        return quantite_mois;
    }
    public void setQuantite_mois(HashMap<String, Double> quantite_mois) {
        this.quantite_mois = quantite_mois;
    }
}
