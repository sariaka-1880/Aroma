package location;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Vector;
import java.sql.PreparedStatement;
import utils.*;

public class Entrepot {
    int identrepot;
    String nom;
    
    
    public Entrepot(String identrepot) throws Exception {
        setIdentrepot(identrepot);
    }

    public  boolean getEntreportById(Connection connect) throws Exception{
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        PreparedStatement statemnt=connect.prepareStatement("select * from "+Constantes.table_entrepot+" where "+Constantes.col_id_entrepot+"  =  "+this.identrepot);
        try {
            ResultSet results = statemnt.executeQuery();
            if(results.next()==true){
                this.setNom(results.getString(Constantes.col_nom_entrepot));
                return true;
            }            
            return false;
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

    public Entrepot(int identrepot, String nom) throws Exception {
        setIdentrepot(identrepot);
        setNom(nom);
    }
    public int getIdentrepot() {
        return identrepot;
    }
    public void setIdentrepot(int identrepot) {
        this.identrepot = identrepot;
    }
    public void setIdentrepot(String identrepot) throws Exception {
        setIdentrepot(Integer.valueOf(identrepot));
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) throws Exception{
        if(nom.length()==0){
            throw new Exception("Produit sans nom");
        }
        this.nom = nom;
    }


    @Override
    public String toString() {
        return "Entrepot [identrepot=" + identrepot + ", nom=" + nom + "]";
    }
    public static Entrepot[] getAllEntrepots(Connection connect) throws Exception{
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        PreparedStatement statemnt=connect.prepareStatement("select * from "+Constantes.table_entrepot);
        try {
            ResultSet results = statemnt.executeQuery();
            Vector<Entrepot> liste = new Vector<Entrepot>();
            while(results.next()){
                liste.add(new Entrepot(results.getInt(Constantes.col_id_entrepot), results.getString(Constantes.col_nom_entrepot)));
            }
            return liste.toArray(new Entrepot[0]);
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

