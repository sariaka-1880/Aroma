package assets;

import java.sql.ResultSet;
import java.util.Vector;
import java.sql.PreparedStatement;

import utils.Constantes;
import utils.MaConnection;
import java.sql.Connection;

public class TypeActivite {
    protected int id;
    protected String nom;  
    public TypeActivite(){}

    public TypeActivite(int id, String nom) throws Exception {
        try {
            setId(id);
            setNom(nom);
        } catch (Exception e) {
            // TODO: handle exception
            throw e;
        }
    }

    public int getId() {
        return id;
    }
    public void setId(int id) throws Exception { 
        if(TypeActivite.checkId(id) == false){
            throw new Exception("l'id que vous avez entré n'existe pas");
        }
        this.id = id;
    }

    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }

    public static boolean checkId(int id) throws Exception {
        Connection connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
        PreparedStatement statemnt=connect.prepareStatement("select idtypeactivite from typeactivite where idtypeactivite = ?");
        statemnt.setInt(1, id);
        try {
            ResultSet results = statemnt.executeQuery();
            int resultat = -1;
            // Vector<TypeActivite> listTypeActivite = new Vector();
            while(results.next()){
                resultat = results.getInt("idtypeactivite");
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

    public static Vector<TypeActivite> getAllTypeActivite() throws Exception {
        Connection connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
        PreparedStatement statemnt=connect.prepareStatement("select * from typeactivite");
        try {
            ResultSet results = statemnt.executeQuery();
            Vector<TypeActivite> listTypeActivite = new Vector();
            while(results.next()){
                listTypeActivite.add(new TypeActivite(results.getInt("idtypeactivite"), results.getString("description")));
            }
            return listTypeActivite;
        } catch (Exception e) {
            connect.rollback();
            throw e;
        }finally{
            statemnt.close();
            connect.close();
        }
    }

    public static TypeActivite getTypeActiviteById(int id) throws Exception {
        Connection connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
        PreparedStatement statemnt=connect.prepareStatement("select * from typeactivite where idtypeactivite = ?");
        statemnt.setInt(1, id);
        try {
            ResultSet results = statemnt.executeQuery();
            TypeActivite typeActivite = new TypeActivite();
            while(results.next()){
                typeActivite.setId(results.getInt("idtypeactivite"));
                typeActivite.setNom(results.getString("description"));
            }
            return typeActivite;
        } catch (Exception e) {
            connect.rollback();
            throw e;
        }finally{
            statemnt.close();
            connect.close();
        }
    }
}
