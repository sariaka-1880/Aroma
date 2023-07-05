package assets;

import java.sql.Connection;
import java.sql.Date;
import utils.Constantes;
import java.sql.PreparedStatement; 
import java.sql.ResultSet;

import utils.MaConnection;

public class Recolte {
    protected ProduitIntermediaire produit_intermediaire;
    protected Date date;
    protected int quantite;

    public Recolte(ProduitIntermediaire produit_intermediaire , Date date , int quantite) throws Exception {
        setProduit_intermediaire(produit_intermediaire);
        setDate(date);
        try {
            setQuantite(quantite);
        } catch (Exception e) {
            // TODO: handle exception
            throw e;
        }
        
    }

    public ProduitIntermediaire getProduit_intermediaire() {
        return produit_intermediaire;
    }
    public void setProduit_intermediaire(ProduitIntermediaire produit_intermediaire) {
        this.produit_intermediaire = produit_intermediaire;
    }

    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }

    public int getQuantite() {
        return quantite;
    }
    public void setQuantite(int quantite) throws Exception {
        if(quantite < 0){
            throw new Exception("la quantite de recolte doit etre positive");
        }
        this.quantite = quantite;
    }

    public double getIdLastPlantation(Connection connex) throws Exception {
        int id = this.produit_intermediaire.getId();
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        PreparedStatement statemnt=connect.prepareStatement("select idProduit from mouvementproduit where date = (select max(date) from mouvementproduit where idproduit = ?) and idproduit = ? ");
        statemnt.setInt(1, id);
        statemnt.setInt(2, id);
        try {
            ResultSet results = statemnt.executeQuery();
            double idProduit = 0;
            if(results.next()){
                idProduit = results.getInt(1);
            }
            return idProduit;
        } catch (Exception e) {
            connect.rollback();
            throw e;
        }finally{
            statemnt.close();
            if(opened){
                connect.close();
            }
        }
    }

    public void insert(Connection connex) throws Exception {
        int idProduit = this.produit_intermediaire.getId();
        Date date_recolte = this.getDate();
        int qunatite = this.getQuantite();
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        PreparedStatement statemnt=connect.prepareStatement("insert into "+Constantes.table_mouvement_produit+" values(default,?,?,?,0,0,?,null)");
        statemnt.setInt(1,idProduit);
        statemnt.setDate(2, date_recolte);
        statemnt.setDouble(3, qunatite);
        statemnt.setDate(4, date_recolte);

        System.out.println("statement1");
        PreparedStatement statement1=connect.prepareStatement("select idrecolte from planteRecolte where idplante = ?");
        statement1.setInt(1, idProduit);

        System.out.println("statement2");
        PreparedStatement statement2=connect.prepareStatement("select quantite_en_plus from mouvementproduit where idmouvementproduit =(select max(idmouvementproduit) from mouvementproduit where idproduit=? ) ");
        System.out.println("idProduit: "+getIdLastPlantation(null));
        statement2.setDouble(1, getIdLastPlantation(null));

        System.out.println("statement3");
        PreparedStatement statement3=connect.prepareStatement("insert into "+Constantes.table_mouvement_produit+" values(default,?,?,0,?,0,?,null)");
        
        
        try {
            System.out.println("execution");
            statemnt.executeUpdate();
            ResultSet results = statement1.executeQuery();
            int idProduitPlante = 0;
            if (results.next()) {
                idProduitPlante = results.getInt(1);
               
            }

            ResultSet resultat_quantite = statement2.executeQuery();
            double quantite_produit = 0;
            if (resultat_quantite.next()) {
                quantite_produit = resultat_quantite.getDouble(1);
            }

            // préparation des données du statement
            statement3.setInt(1,idProduitPlante);
            statement3.setDate(2, date_recolte);
            statement3.setDouble(3, quantite_produit);
            statement3.setDate(4, date_recolte);
            statement3.executeUpdate();

            if(opened){
                connect.commit();
            }
            
        } catch (Exception e) {
            connect.rollback();
            e.printStackTrace();
            throw e;
        }finally{
            statemnt.close();
            statement3.close();
            statement2.close();
            statement1.close();
            if(opened){
                connect.close();
            }
        }
    }
}
