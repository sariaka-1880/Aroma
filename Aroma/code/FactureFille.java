package servlet.vente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import assets.produit.ProduitFini;
import utils.MaConnection;
import utils.Constantes;


public class FactureFille {
    int idFactureFille;
    Facture facture;
    ProduitFini produit;

    public int getIdFactureFille() {
        return idFactureFille;
    }
    public void setIdFactureFille(int idFactureFille) {
        this.idFactureFille = idFactureFille;
    }
    public Facture getFacture() {
        return facture;
    }
    public void setFacture(Facture facture) {
        this.facture = facture;
    }
    public ProduitFini getProduit() {
        return produit;
    }
    public void setProduit(ProduitFini produit) {
        this.produit = produit;
    }
    
    public FactureFille(int idFactureFille, Facture facture, ProduitFini produit) {
        this.idFactureFille = idFactureFille;
        this.facture = facture;
        this.produit = produit;
    }

    public FactureFille() {
    }

    public void insertFactureFille(Connection co,int idFacture,int idProduit,int quantite) throws Exception{
        Connection connex = co;
        boolean opened = false;

        if (connex==null) {
            connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened = true;
        }

        try {

            String req = "SELECT prix from v_prixActuel WHERE idproduit = ?";
            PreparedStatement ps = connex.prepareStatement(req);
            ps.setInt(1, idProduit);
            ResultSet resultat = ps.executeQuery();
            double prix = 0;
            while (resultat.next()) {
                prix = resultat.getDouble("prix");
            }
            
            String query = "INSERT INTO FactureFille (idFacture, idProduit,quantite,prix-unitaire) VALUES (?,?,?;?)";

            PreparedStatement stmt = connex.prepareStatement(query);
            stmt.setInt(1, idFacture);
            stmt.setInt(2, idProduit);
            stmt.setInt(3, quantite);
            stmt.setDouble(3, prix);

            stmt.executeQuery();
        } catch (Exception e) {

        }
    }
    
}
