package servlet.vente;

import assets.produit.ProduitFini;

public class Panier {
    ProduitFini produitFini;
    int quantite;
    double prixProduit;
    

    public ProduitFini getProduitFini() {
        return produitFini;
    }

    public void setProduitFini(ProduitFini produitFini) {
        this.produitFini = produitFini;
    }

    public int getQuantite() {
        return quantite;
    }
    
    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public double getPrixProduit() {
        return prixProduit;
    }

    public void setPrixProduit(double prixProduit) {
        this.prixProduit = prixProduit;
    }
}
