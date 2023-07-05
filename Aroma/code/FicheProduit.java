package assets.produit;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Vector;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

import java.sql.*;
import java.util.*;
import utils.MaConnection;
import utils.*;

public class FicheProduit{
    //private ProduitFini produitFini;
    private int idproduit_Fini;
    private String[] vertu;
    private String[] image; 
    private double stock;


    public double getStock() {
        return stock;
    }

    // public ProduitFini getProduitFini() {
    //     return produitFini;
    // }
    // public void setProduitFini(ProduitFini produitFini) {
    //     this.produitFini = produitFini;
    // }

    public void setId(int idproduit_Fini){
        this.idproduit_Fini = idproduit_Fini;
    }
    public int getId(){
        return idproduit_Fini;
    }
    public void setStock(double stock) {
        this.stock = stock;
    }
    public static FicheProduit[] getAllProduits(Connection con) throws Exception{
        return new  FicheProduit[0];
    }
    //si disponible() => "disponible", sinon => "Stock épuisé"
    public String getDisponibiliteString(Connection con) throws Exception{
        return "Disponible";
    }
    //si stock.quantite>0 then true, else false
    public boolean disponible(){
        return true;
    }
    //select * from v_liste_stock where idproduit = this.produit.idproduit
    public double getStock(Connection con) throws Exception{
        return 0;
    }
    //select prix where idproduit = this.produit.idproduit
    public double getPrix(Connection con) throws Exception{
        return 0;
    }
    //select vertu from vertus where idproduit = this.produit.idproduit
    public String[] getVertus(Connection con) throws Exception{
        return new String[0];
    }
    //select image from image where idproduit = this.produit.idproduit
    public String getImage(Connection con){
        return "image.png";
    }
    public String[] getVertu() {
        return vertu;
    }
    public void setVertu(String[] vertu) {
        this.vertu = vertu;
    }
    public String[] getImage() {
        return image;
    }
    public void setImage(String[] image) {
        this.image = image;
    }

    public FicheProduit(int idproduit_Fini, String[] vertu, String[] image, double stock) {
        this.idproduit_Fini = idproduit_Fini;
        this.vertu = vertu;
        this.image = image;
        this.stock = stock;
    }

     public FicheProduit(int idproduit_Fini, String[] vertu, String[] image) {
        this.idproduit_Fini = idproduit_Fini;
        this.vertu = vertu;
        this.image = image;
    }

    

    public FicheProduit() {
    }


    public FicheProduit getFicheByProduct(Connection co,int idproduit_Fini) throws Exception{
        Connection connex = co;
        boolean opened = false;
        FicheProduit fp = new FicheProduit();

        if (connex==null) {
            connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened = true;
        }
       
        try {
            String query1 = "SELECT vertu FROM vertu WHERE idproduit = ?";
            PreparedStatement stmt = connex.prepareStatement(query1);
            stmt.setInt(1, idproduit_Fini);
            ResultSet rs = stmt.executeQuery();
            List<String> vertuList = new ArrayList<>();
            while (rs.next()) {
                String vertu = rs.getString("vertu");
                vertuList.add(vertu);
            }
            String[] vertuArray = vertuList.toArray(new String[0]);

            String query2 = "SELECT image FROM image WHERE idproduit = ?";
            PreparedStatement stat = connex.prepareStatement(query2);
            stat.setInt(1, idproduit_Fini);
            ResultSet res = stat.executeQuery();
            List<String> imageList = new ArrayList<>();
            while (res.next()) {
                String vertu = res.getString("image");
                imageList.add(vertu);
            }
            String[] imageArray = imageList.toArray(new String[0]);

            String query3 = "SELECT prix from v_prixActuel WHERE idproduit = ?";
            PreparedStatement ps = connex.prepareStatement(query2);
            ps.setInt(1, idproduit_Fini);
            ResultSet resultat = ps.executeQuery();
            double prix = 0;
            while (resultat.next()) {
                prix = resultat.getDouble("prix");
            }
            
            //fp = new FicheProduit(idproduit_Fini,vertuArray,imageArray,prix);
            fp.setId(idproduit_Fini);
            fp.setVertu(vertuArray);
            fp.setImage(imageArray);

        } catch (Exception e) {
            // TODO: handle exception
        }
        return fp;
    }


    public static ArrayList<FicheProduit> getListFicheProduits(Connection co, int idproduit_Fini) {
        Connection connex = co;
        boolean opened = false;
        ArrayList<FicheProduit> ficheProduits = new ArrayList<FicheProduit>();
        ArrayList<String> listvertus = new ArrayList<>();
    
        if (connex == null) {
            try {
                connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
                opened = true;
            } catch (Exception exp) {
                System.out.println(exp.getMessage());
            }
        }
    
        try {
            String requete = "SELECT * FROM v_produits WHERE idproduit = ?";
            PreparedStatement statemnt = connex.prepareStatement(requete);
            statemnt.setInt(1, idproduit_Fini);
            ResultSet results = statemnt.executeQuery();
    
            // Utiliser le ResultSet pour récupérer les données
            while (results.next()) {
                String vertu = results.getString("vertu");
                listvertus.add(vertu);
            }
    
            FicheProduit fiche = new FicheProduit();
            String[] vertusArray = listvertus.toArray(new String[listvertus.size()]);
            fiche.setVertu(vertusArray);
            ficheProduits.add(fiche);
    
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (opened && connex != null) {
                try {
                    connex.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return ficheProduits;
    }
    

    public static ArrayList<FicheProduit> getListFicheProduitsPhoto (Connection co, int idproduit_Fini) {
        Connection connex = co;
        boolean opened = false;
        ArrayList<FicheProduit> ficheProduits = new ArrayList<FicheProduit>();
        ArrayList<String> listphotos = new ArrayList<>();
    
        if (connex == null) {
            try {
                connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
                opened = true;
            } catch (Exception exp) {
                System.out.println(exp.getMessage());
            }
        }
    
        try {
            String requete = "select * from image WHERE idproduit = ?";
            PreparedStatement statemnt = connex.prepareStatement(requete);
            statemnt.setInt(1, idproduit_Fini);
            ResultSet results = statemnt.executeQuery();
    
            // Utiliser le ResultSet pour récupérer les données
            while (results.next()) {
                String photo = results.getString("image");
                listphotos.add(photo);
            }
    
            FicheProduit fiche = new FicheProduit();
            String[] liste = listphotos.toArray(new String[listphotos.size()]);
            fiche.setImage(liste);
            ficheProduits.add(fiche);
    
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (opened && connex != null) {
                try {
                    connex.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return ficheProduits;
    }
    
}