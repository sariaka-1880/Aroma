package assets;

import java.sql.Connection;

public class MatierePremiere extends Produit{
    double quantite_utile;
    
    public MatierePremiere(int idproduit,String nom,double quantite_utile) throws Exception {
        super(idproduit,nom);
        setQuantite_utile(quantite_utile);
    }
    
    public double getQuantite_utile() {
        return quantite_utile;
    }

    
    public void setQuantite_utile(double quantite_utile) throws Exception {
        if(quantite_utile<0){
            throw new Exception("Quantite utile invalide");
        }
        this.quantite_utile = quantite_utile;
    }
}
