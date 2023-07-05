package assets;

import java.sql.Connection;
import utils.Constantes;
import utils.MaConnection;
import java.sql.ResultSet;
import java.util.Vector;
import java.sql.PreparedStatement;

public class Produit {
    protected int id;
    protected String nom;
    protected Unite unite;
    protected TypeProduit type;

    public Produit(){}

    public Produit(String nom){
        setNom(nom);
    }
    
    public Produit(int id){
        setId(id);
    }
    public Produit (int id,String nom){
        setId(id);
        setNom(nom);
    }
    public Produit(int id,String nom,Unite unite,TypeProduit type){
        setId(id);
        setNom(nom);
        setUnite(unite);
        setType(type);
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public void setId(String idstring){
        int id=Integer.parseInt(idstring);
        setId(id);
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public Unite getUnite() {
        return unite;
    }
    public void setUnite(Unite unite) {
        this.unite = unite;
    }
    public TypeProduit getType() {
        return type;
    }
    public void setType(TypeProduit type) {
        this.type = type;
    }

    public static Vector getListeRecolte(Connection connex) throws Exception {
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        PreparedStatement statemnt=connect.prepareStatement("select * from produit where idtypeproduit = 3");
        try {
            ResultSet results = statemnt.executeQuery();
            Vector listeRecolte = new Vector<String>();
            while(results.next()){
                listeRecolte.add(results.getString(2));
            }
            return listeRecolte;
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
    public double getQuantiteEnStock(Connection con) throws Exception{
        Stock st = new Stock(this);
        st.getStockByProduit(con);
        return st.getQuantite();
    }
    
    public static Vector<Stock> getStock(Connection connex) throws Exception {
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        PreparedStatement statemnt=connect.prepareStatement("select * from v_liste_stock");
        try {
            ResultSet results = statemnt.executeQuery();
            Vector listStock = new Vector<Stock>();
            while(results.next()){
                Unite unite = new Unite(results.getString("nom_unite"));
                TypeProduit typeProduit = new TypeProduit(results.getString("nom_type_produit"),results.getBoolean("stockable"));
                Produit produit = new Produit(results.getInt("idressource"),results.getString("nom_produit") , unite, typeProduit);
                Stock stock = new Stock(produit, results.getDouble("quantite_restant"));
                listStock.add(stock);
            }
            return listStock;
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

    public static Produit getProduitById(int id,Connection connex) throws Exception {
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        PreparedStatement statemnt=connect.prepareStatement("select * from produit where idproduit = ?");
        statemnt.setInt(1, id);
        try {
            ResultSet result = statemnt.executeQuery();
            // Vector listStock = new Vector<Stock>();
            if(result.next()){
                return new Produit(result.getInt("idproduit"),result.getString("nom_produit"), new Unite(result.getInt("idunite")), new TypeProduit(result.getInt("idtypeproduit")));
            }
            return null;
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

}
