package servlet.vente;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Vector;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

import java.sql.*;
import java.util.*;
import utils.MaConnection;
import utils.*;
import utils.Constantes;


public class Client {
    int idClient;
    String nom;
    String numero;
    String adresse;
    int est_distributeur;

    
    public int getIdClient() {
        return idClient;
    }
    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getNumero() {
        return numero;
    }
    public void setNumero(String numero) {
        this.numero = numero;
    }
    public String getAdresse() {
        return adresse;
    }
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }
    public int getEst_distributeur() {
        return est_distributeur;
    }
    public void setEst_distributeur(int est_distributeur) {
        this.est_distributeur = est_distributeur;
    }


    public Client(int idClient, String nom, String numero, String adresse, int est_distributeur) {
        this.idClient = idClient;
        this.nom = nom;
        this.numero = numero;
        this.adresse = adresse;
        this.est_distributeur = est_distributeur;
    }

    
    
    public Client(String nom, String numero, String adresse,int est_distributeur) {
        this.nom = nom;
        this.numero = numero;
        this.adresse = adresse;
        this.est_distributeur = est_distributeur;
    }
    public Client() {
        
    }


    public void insertClient(Connection co,String nom,String numero,String adresse) throws Exception{
        Connection connex = co;
        boolean opened = false;

        if (connex==null) {
            connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened = true;
        }
        opened=true;
        String query = "INSERT INTO client(nom,numero,adresse) VALUES ('"+nom+"','"+numero+"','"+adresse+"')";
        PreparedStatement stmt = connex.prepareStatement(query);
        try {
            
            System.out.println(query);
            stmt.executeUpdate();
            if(opened){
                connex.commit();
                System.out.println("tokony miditra");
            }
        } catch (Exception e) {
            connex.rollback();
            throw e;
        }finally{
            stmt.close();
            if(opened){
                connex.close();
            }
        }
    }

    public int getId(Connection co) throws Exception{
        Connection connex = co;
        boolean opened = false;
        int id = 0;

        if (connex==null) {
            connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened = true;
        }

        try {
            String query = "SELECT max(idclient) as id from client";
            PreparedStatement ps = connex.prepareStatement(query);
            ResultSet resultat = ps.executeQuery();
            while (resultat.next()) {
                id = resultat.getInt("id");
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return id;
    }
}
