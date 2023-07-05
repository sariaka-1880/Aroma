package assets;
// import org.json.simple.JSONObject;

import java.rmi.server.ExportException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Vector;
import java.sql.Connection;
import utils.Constantes;
import utils.MaConnection;
import java.util.Map;
import utils.Constantes2;
import assets.StatistiqueProduit;


public class StatistiqueCulture {
    HashMap<String,Double> total_plante_mois_annee;
    HashMap<String,Double> total_recolte_mois_annee;
    double total_plante_annee;
    double total_recolte_annee;
    double total_plante_mois;
    double total_recolte_mois;
    double hausse_annee;
    double hausse_mois;

    public StatistiqueCulture(Produit produit) throws Exception {
        MaConnection connect = new MaConnection();
        Connection conn = connect.getConnection(Constantes2.database, Constantes2.username, Constantes2.password);
        try {
            setTotal_plante_mois_annee(getTotal_plante_mois_annee(conn,produit));
            setTotal_recolte_mois_annee(getTotal_recolte_mois_annee(conn,produit));
            setTotal_plante_annee(getTotal_plante_annee(conn,produit));
            setTotal_recolte_annee(getTotal_recolte_annee(conn,produit));
            setHausse_annee(getHausse_annee(conn,produit));
            setHausse_mois(getHausse_mois(conn,produit));
        } catch (Exception e) {
            // TODO: handle exception
            throw e;
        } finally {
            conn.close();
        }
        
    }

    //maka anaty base
    public double getHausse_mois(Connection connect, Produit produit) throws Exception {
        // hausse plante par rapport au mois dernier 
        if(produit.getType().getId() == 2){
            PreparedStatement statemnt=connect.prepareStatement("select * from v_hausse_mois_dernier where idproduit = ?");
            statemnt.setInt(1, produit.getId());
            try {
                ResultSet result = statemnt.executeQuery();
                
                if(result.next()){
                    return result.getDouble("hausse");
                }
                return 0;
            } catch(Exception e) {
                throw e;
            }
        }
        // hausse recolte par rapport au mois dernier
        if(produit.getType().getId() == 3){
            PreparedStatement statemnt=connect.prepareStatement("select * from v_hausse_mois_precedent where idproduit = ?");
            statemnt.setInt(1, produit.getId());
            try {
                ResultSet result = statemnt.executeQuery();
                
                if(result.next()){
                    return result.getDouble("hausse_recolte_mois");
                }
                return 0;
            } catch(Exception e) {
                throw e;
            }
        }
        return 0;
    }

    //maka anaty base
    public double getHausse_annee(Connection connect, Produit produit) throws Exception {
        // hausse plante par rapport a l'annee derniere
        if(produit.getType().getId() == 2){
            PreparedStatement statemnt=connect.prepareStatement("select * from v_hausse_annee_derniere where idproduit = ?");
            statemnt.setInt(1, produit.getId());
            try {
                ResultSet result = statemnt.executeQuery();
                
                if(result.next()){
                    return result.getDouble("hanneederniere");
                }
                return 0;
            } catch(Exception e) {
                throw e;
            }
        }
        // hausse recolte par rapport a l'annee derniere
        if(produit.getType().getId() == 3){
            PreparedStatement statemnt=connect.prepareStatement("select * from v_hausse_recolte_annee_derniere where idproduit = ?");
            statemnt.setInt(1, produit.getId());
            try {
                ResultSet result = statemnt.executeQuery();
                
                if(result.next()){
                    return result.getDouble("hausse_annee_derniere");
                }
                return 0;
            } catch(Exception e) {
                throw e;
            }
        }
        return 0;
    }

    //maka anaty base
    public double getTotal_plante_mois(Connection connect, Produit produit) throws Exception {
        // Planté ce mois par produit 
        PreparedStatement statemnt=connect.prepareStatement("select * from v_total_plante_mois_actuelle where idproduit = ?");
        statemnt.setInt(1, produit.getId());
        try {
            ResultSet result = statemnt.executeQuery();
            
            if(result.next()){
                return result.getDouble("quantite");
            }
            return 0;
        } catch(Exception e) {
            throw e;
        }
        // return 0;
    }

    //maka anaty base
    public double getTotal_recolte_mois(Connection connect, Produit produit) throws Exception {
        // recolte ce mois par produit
        PreparedStatement statemnt=connect.prepareStatement("select * from v_total_recolte_mois_now where idproduit = ?");
        statemnt.setInt(1, produit.getId());
        try {
            ResultSet result = statemnt.executeQuery();
            
            if(result.next()){
                return result.getDouble("total");
            }
            return 0;
        } catch(Exception e) {
            throw e;
        }
        // return 0;
    }

    //maka anaty base
    public double getTotal_plante_annee(Connection connect, Produit produit) throws Exception {
        // plante cette année
        PreparedStatement statemnt=connect.prepareStatement("select * from v_total_recolte_mois_now where idproduit = ?");
        statemnt.setInt(1, produit.getId());
        try {
            ResultSet result = statemnt.executeQuery();
            
            if(result.next()){
                return result.getDouble("total");
            }
            return 0;
        } catch(Exception e) {
            throw e;
        }
        // return 0;
    }

    //maka anaty base
    public double getTotal_recolte_annee(Connection connect, Produit produit) throws Exception {
        // recolte cette annee
        PreparedStatement statemnt=connect.prepareStatement("select * from v_recolte_annee where idproduit = ?");
        statemnt.setInt(1, produit.getId());
        try {
            ResultSet result = statemnt.executeQuery();
            
            if(result.next()){
                return result.getDouble("total");
            }
            return 0;
        } catch(Exception e) {
            throw e;
        }
        // return 0;
    }

    //maka anaty base

    public HashMap<String, Double> getTotal_plante_mois_annee(Connection  connect, Produit produit) throws Exception {
        // total planté par mois
        PreparedStatement statemnt=connect.prepareStatement("select * from v_total_plante_pour_tout_mois where idproduit = ?");
        statemnt.setInt(1, produit.getId());
        try {
            ResultSet results = statemnt.executeQuery();
            HashMap<String, Double> listPlanteParMois = new HashMap();
            while(results.next()){
                listPlanteParMois.put(results.getString("nom_mois"), results.getDouble("quantite"));
            }
            return listPlanteParMois;
        } catch(Exception e) {
            throw e;
        }
    }

    //transformer les doubles de this.total_plante_mois_annee en json
    public String get_total_plante_mois_annee_string(){
        String json = "[";
        int tour = 0;
        for(Map.Entry<String , Double> entry : this.total_plante_mois_annee.entrySet()){
            tour++;
            json = json + this.total_plante_mois_annee.get(entry.getKey());
            if(tour != this.total_plante_mois_annee.size()){
                json = json+",";
            }
        }
        if(tour == 0){
            for(int i=0;i<12;i++){
                json = json + "0,";
            }
            json = json.substring(0, json.length()-1);
        }
        json = json + "]";
        return json;
    }
    public HashMap<String, Double> getTotal_recolte_mois_annee(Connection  connect, Produit produit) throws Exception {
        // total recolté par mois
        PreparedStatement statemnt=connect.prepareStatement("select * from v_total_recolte_mois_an where idproduit = ?");
        statemnt.setInt(1, produit.getId());
        try {
            ResultSet results = statemnt.executeQuery();
            HashMap<String, Double> listRecolteParMois = new HashMap();
            while(results.next()){
                listRecolteParMois.put(results.getString("nom_mois"), results.getDouble("total"));
            }
            return listRecolteParMois;
        } catch(Exception e) {
            throw e;
        }
    }

    //transformer les doubles de total_recolte_mois_annee en json
    public String get_total_recolte_mois_annee_string(){
        String json = "[";
        int tour = 0;
        for(Map.Entry<String , Double> entry : this.total_recolte_mois_annee.entrySet()){
            tour++;
            json = json + this.total_recolte_mois_annee.get(entry.getKey());
            if(tour != this.total_recolte_mois_annee.size()){
                json = json+",";
            }
        }
        if(tour == 0){
            for(int i=0;i<12;i++){
                json = json + "0,";
            }
            json = json.substring(0, json.length()-1);
        }
        json = json + "]";
        return json;
    }

    public HashMap<String, Double> getTotal_plante_mois_annee() {
        return total_plante_mois_annee;
    }
    public void setTotal_plante_mois_annee(HashMap<String, Double> total_plante_mois_annee) {
        this.total_plante_mois_annee = total_plante_mois_annee;
    }

    public HashMap<String, Double> getTotal_recolte_mois_annee() {
        return total_recolte_mois_annee;
    }
    public void setTotal_recolte_mois_annee(HashMap<String, Double> total_recolte_mois_annee) {
        this.total_recolte_mois_annee = total_recolte_mois_annee;
    }

    public double getTotal_plante_annee() {
        return total_plante_annee;
    }
    public void setTotal_plante_annee(double total_plante_annee) {
        this.total_plante_annee = total_plante_annee;
    }

    public double getTotal_recolte_annee() {
        return total_recolte_annee;
    }
    public void setTotal_recolte_annee(double total_recolte_annee) {
        this.total_recolte_annee = total_recolte_annee;
    }

    public double getTotal_plante_mois() {
        return total_plante_mois;
    }
    public void setTotal_plante_mois(double total_plante_mois) {
        this.total_plante_mois = total_plante_mois;
    }

    public double getTotal_recolte_mois() {
        return total_recolte_mois;
    }
    public void setTotal_recolte_mois(double total_recolte_mois) {
        this.total_recolte_mois = total_recolte_mois;
    }

    public double getHausse_annee() {
        return hausse_annee;
    }
    public String getHausse_annee_String(){
        double hausse_annee = this.getHausse_annee();
        if(hausse_annee > 0){
            return "+"+hausse_annee;
        } else {
            return String.valueOf(hausse_annee);
        }
    }
    public void setHausse_annee(double hausse_annee) {
        this.hausse_annee = hausse_annee;
    }

    public double getHausse_mois() {
        return hausse_mois;
    }
    public String getHausse_mois_String(){
        double hausse_mois = this.getHausse_mois();
        if(hausse_mois > 0){
            return "+"+hausse_mois;
        } else {
            return String.valueOf(hausse_mois);
        }
    }
    public void setHausse_mois(double hausse_mois) {
        this.hausse_mois = hausse_mois;
    }

    public StatistiqueProduit selectTotal_plante_mois_annee(Connection connex) throws Exception {
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        PreparedStatement statemnt=connect.prepareStatement("select * from v_total_plante_pour_tout_mois");
        try {
            ResultSet results = statemnt.executeQuery();
            HashMap<String,Double> quantite_mois = new HashMap();
            String nom_produit = " ";
            while(results.next()){
                quantite_mois.put(results.getString("nom_mois"), results.getDouble("quantite"));
                nom_produit = results.getString("nom_produit");
            }
            StatistiqueProduit produit_stat = new StatistiqueProduit(nom_produit, quantite_mois);
            return produit_stat;
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

    public static String getIcon(double valeur){
        if(valeur < 0){
            return "fa fa-12 fa-arrow-down text-danger";
        } else if(valeur == 0){
            return "fa fa-12 fa-arrow-right text-warning";
        } else {
            return "fa fa-12 fa-arrow-up text-success";
        }
    }
}

