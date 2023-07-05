package assets;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.Vector;
import java.sql.PreparedStatement;

import utils.Constantes;
import utils.MaConnection;
import java.sql.Connection;

public class Activite{
    protected Date debut;
    protected Date fin;
    protected String intitule;
    protected int duree;
    protected TypeActivite typeActivite;
    protected Produit produit;
    
    public Activite(String debut, String idProduit, String duree, String idTypeActivite) throws Exception {
        try {
            setDebut(debut.trim());
            setTypeActivite(idTypeActivite.trim());
            setProduit(idProduit.trim());
            setDuree(duree.trim());
        } catch (Exception e) {
            // TODO: handle exception
            throw e;
        }
    }

    public Activite(Date debut, Date fin , String intitule){
        setDebut(debut);
        setFin(fin);
        setIntitule(intitule);
    }

    public Date getDebut() {
        return debut;
    }
    public void setDebut(String debut) throws Exception {
        if(debut == null || debut.length() == 0){
            throw new Exception("la date de debut ne doit pas etre vide");
        }
        try {
            setDebut(Date.valueOf(debut.trim()));
        } catch (Exception e) {
            // TODO: handle exception
            throw new Exception("format de la date invalide");
        }
    }
    public void setDebut(Date debut) {
        this.debut = debut;
    }

    public Date getFin() {
        return fin;
    }
    public void setFin(String fin) throws Exception {
        if(fin == null || fin.length() == 0){
            throw new Exception("la date de fin ne doit pas etre vide");
        }
        try {
            setFin(Date.valueOf(fin));
        } catch (Exception e) {
            // TODO: handle exception
            throw new Exception("format de la date invalide");
        }
    }
    public void setFin(Date fin) {
        this.fin = fin;
    }

    public String getIntitule() {
        return intitule;
    }
    public void setIntitule(String intitule) {
        this.intitule = intitule;
    }

    public int getDuree() {
        return duree;
    }
    public void setDuree(String duree) throws Exception {
        if(duree == null || duree.length() == 0){
            throw new Exception("la duree ne doit pas etre vide");
        }
        try {
            setDuree(Integer.parseInt(duree));
        } catch (Exception e) {
            // TODO: handle exception
            throw new Exception("format de la duree invalide");
        }
    }
    public void setDuree(int duree) throws Exception {
        if(duree <= 0){
            throw new Exception("la duree doit etre positive");
        }
        this.duree = duree;
    }

    public TypeActivite getTypeActivite() {
        return typeActivite;
    }
    public void setTypeActivite(String idTypeActivite) throws Exception {
        try {
            int type = Integer.parseInt(idTypeActivite); 
            setTypeActivite(TypeActivite.getTypeActiviteById(type));
        } catch (Exception e) {
            // TODO: handle exception
            throw e;
        }
    }
    public void setTypeActivite(TypeActivite typeActivite) {
        this.typeActivite = typeActivite;
    }

    public Produit getProduit() {
        return produit;
    }
    public void setProduit(String idProduit) throws Exception {
        try {
            setProduit(new Produit(Integer.parseInt(idProduit)));
            if(checkActiviteTypeProduit() == false){
                throw new Exception("le produit choisi ne correspond pas au type d'activité");
            }
        } catch (Exception e) {
            // TODO: handle exception
            throw e;
        }
    }
    public void setProduit(Produit produit) {
        this.produit = produit;
    }

    public static Vector<Activite> getAllActivite() throws Exception {
        Connection connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
        PreparedStatement statemnt=connect.prepareStatement("select * from v_activite");
        try {
            ResultSet results = statemnt.executeQuery();
            Vector<Activite> listActivite = new Vector(); 
            while(results.next()){
                listActivite.add(new Activite(results.getDate("datedebutactivite"), results.getDate("datefinactivite"), results.getString("intitule")));
            }
            return listActivite;
        } catch (Exception e) {
            connect.rollback();
            throw e;
        }finally{
            statemnt.close();
            connect.close();
        }
    }

    public static String ArrayToString(Vector<Activite> listActivite){
        String value = ""; 
        int nbr_tour = 0;
        for (Activite activite : listActivite) {
            nbr_tour++;
            value = value+"{";
            value = value+" title: '"+activite.getIntitule()+"',";
            value = value+" start: '"+activite.getFin().toString()+"',";
            value = value+" end: '"+activite.getDebut().toString()+"'";
            value = value+" }";
            if(nbr_tour != listActivite.size()){
                value = value+",";
            }
        }
        return value;
    }

    public int getTypeProduitByIdTypeActivite() throws Exception {
        Connection connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
        PreparedStatement statemnt=connect.prepareStatement(" select idtypeproduit from activite_type_produit where idtypeactivite = ?");
        statemnt.setInt(1, this.getTypeActivite().getId());
        try {
            ResultSet results = statemnt.executeQuery();
            int resultat = -1;
            // Vector<TypeActivite> listTypeActivite = new Vector();
            while(results.next()){
                resultat = results.getInt("idtypeproduit");
            }
            if(resultat == -1){
                throw new Exception("le typeActivite n'existe pas");
            }
            return resultat;
        } catch (Exception e) {
            connect.rollback();
            throw e;
        }finally{ 
            statemnt.close();
            connect.close();
        }
    }

    public boolean checkActiviteTypeProduit() throws Exception {

        Connection connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
        PreparedStatement statemnt=connect.prepareStatement(" select * from produit where idproduit = ? and idtypeproduit = ?");
        
        try {
            int idtypeproduit = this.getTypeProduitByIdTypeActivite();
            statemnt.setInt(1, this.getProduit().getId());
            statemnt.setInt(2, idtypeproduit);
            ResultSet results = statemnt.executeQuery();
            int resultat = -1;
            // Vector<TypeActivite> listTypeActivite = new Vector();
            while(results.next()){
                resultat = 1;
            }
            if(resultat == -1){
                return false;
            }
            return true;
        } catch (Exception e) {
            connect.rollback();
            throw e;
        }finally{ 
            statemnt.close();
            connect.close();
        }
    }

    public void insert(Connection connex) throws Exception{
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        PreparedStatement statemnt=connect.prepareStatement("insert into activite values(default,?,?,?, (?::date) + ('24:00:00'::interval) * ? ,now())");
        statemnt.setInt(1,getProduit().getId());
        statemnt.setInt(2, getTypeActivite().getId());
        statemnt.setDate(3, getDebut());
        statemnt.setDate(4, getDebut());
        statemnt.setInt(5, getDuree());
        try {
            statemnt.executeUpdate();
            if(opened){
                connect.commit();
            }
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