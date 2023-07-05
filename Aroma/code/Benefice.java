package assets.finance;

import java.sql.*;
import java.util.Vector;
import utils.MaConnection;
import utils.Constantes;
import utils.Util;
public class Benefice {
    double valeur;
    int mois;
    int annee;
    public Benefice() {
    }
    public Benefice(double valeur, int mois) {
        setValeur(valeur);
        setMois(mois);
    }
    public boolean getBenefice(Connection connect) throws Exception{
        boolean opened = false;
        if(connect == null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        String requete = "select * from v_benefice order by mois where annee = "+annee+" and mois = "+mois;
        Statement stmt = connect.createStatement();
        try {
            ResultSet res  = stmt.executeQuery(requete);
            
            if(res.next() == false){
                return false;
            }
            setValeur(res.getDouble("benefice"));
            return true;
        } 
        catch (Exception e) {
            throw e;
        }
        finally{
            stmt.close();
            if(opened){
                connect.close();
            }
        }
    }
    public static Benefice[] getBeneficeCetteAnnee(Connection connect) throws Exception{
        boolean opened = false;
        if(connect == null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        String requete = "select * from v_benefice where  annee = "+Util.getCurrentYear()+" order by mois ";
        Statement stmt = connect.createStatement();
        try {
            ResultSet res  = stmt.executeQuery(requete);
            Benefice[] benefice = new Benefice[12];
            int i = 0;
            while (res.next()) {
                benefice[i] = new Benefice(res.getDouble("benefice"),res.getInt("mois"));
                i++;
            }
            return benefice;
        } 
        catch (Exception e) {
            throw e;
        }
        finally{
            stmt.close();
            if(opened){
                connect.close();
            }
        }
    }

    public double getValeur() {
        return valeur;
    }

    public void setValeur(double valeur) {
        this.valeur = valeur;
    }

    public int getMois() {
        return mois;
    }

    public void setMois(int mois) {
        this.mois = mois;
    }
    public int getAnnee() {
        return annee;
    }
    public void setAnnee(int annee) {
        this.annee = annee;
    }

}
