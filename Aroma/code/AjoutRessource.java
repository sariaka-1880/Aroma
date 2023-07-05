package assets;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import utils.Constantes;
import utils.MaConnection;
import utils.exceptions.QuantiteNegativeException;

public class AjoutRessource {
    private int id;
    private Ressource ressource;
    private Fournisseur fournisseur;
    private double quantite;
    private LocalDate dateajout;
    private LocalDate dateperemption;
    private double prixUnitaire;

    public AjoutRessource(Ressource ressource,LocalDate date,double quantite, double prixUnitaire,LocalDate dateperemption, Fournisseur fournisseur){
        this.setRessource(ressource);
        this.setDateajout(date);
        try {
            this.setQuantite(quantite);
            this.setPrixUnitaire(prixUnitaire); 
        } catch (Exception e) {
            // TODO: handle exception
         
        }

        this.setFournisseur(fournisseur);
        this.setDateajout(dateajout);
        this.setDateperemption(dateajout);
    }
    public LocalDate getDateperemption() {
        return dateperemption;
    }
    public void setDateperemption(LocalDate dateperemption) {
        this.dateperemption = dateperemption;
    }


    public double getPrixUnitaire() {
        return prixUnitaire;
    }
    public void setPrixUnitaire(double prixUnitaire) throws QuantiteNegativeException {
        if(prixUnitaire<=0){
            throw new QuantiteNegativeException();
        }
        this.prixUnitaire = prixUnitaire;
    }
    public void setPrixUnitaire(String prixString) throws QuantiteNegativeException{
        double realPrix=Double.parseDouble(prixString);
        setPrixUnitaire(realPrix);
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public Ressource getRessource() {
        return ressource;
    }
    public void setRessource(Ressource ressource) {
        this.ressource = ressource;
    }

    public Fournisseur getFournisseur() {
        return fournisseur;
    }
    public void setFournisseur(Fournisseur fournisseur) {
        this.fournisseur = fournisseur;
    }

    public double getQuantite() {
        return quantite;
    }
    public void setQuantite(double quantite) throws QuantiteNegativeException {
        if(quantite<=0){
            throw new QuantiteNegativeException();
        }
        this.quantite = quantite;
    }
    public void setQuantite(String quantiteString) throws QuantiteNegativeException{
        double realQuantite=Double.parseDouble(quantiteString);
        setQuantite(realQuantite);
    }

    public double getPrixAchat(){
        return getPrixUnitaire()*getQuantite();
    }
    public LocalDate getDateajout() {
        return dateajout;
    }
    public void setDateajout(LocalDate dateajout) {
        this.dateajout = dateajout;
    }
 
    public Date getUtilsDate(){
        Date realDate=Date.valueOf(getDateajout());
        return realDate;
    }

    public Date getUtilsDatePeremption(){
        Date realDate=Date.valueOf(getDateperemption());
        return realDate;
    }
  
    public boolean insert(Connection connex) throws Exception{
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        PreparedStatement statemnt=connect.prepareStatement("insert into "+Constantes.table_mouvement_produit+"(idproduit, date, quantite_en_plus, quantite_en_moins, prixachat, dateperemption, idfournisseur) values(?,?,?,0,?,?,?)");
        statemnt.setInt(1,getRessource().getId());
        statemnt.setDate(2, getUtilsDate());
        statemnt.setDouble(3, getQuantite());
        statemnt.setDouble(4, getPrixAchat());
        statemnt.setDate(5, getUtilsDatePeremption());
        statemnt.setInt(6, getFournisseur().getId());
        try {
            statemnt.executeUpdate();
            if(opened){
                connect.commit();
            }
            return true;
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
