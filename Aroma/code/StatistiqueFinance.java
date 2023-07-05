package assets;

import java.sql.*;
import java.text.NumberFormat;

import utils.MaConnection;
import assets.finance.Benefice;
import assets.report.Caisse;
import utils.Constantes;
import java.util.Calendar;
import java.util.Locale;
import utils.Util;

public class StatistiqueFinance {
    Benefice[] benefice;
    Caisse caisse;
    double evolution;

    public String getIcone(){
        if(evolution<0){
            return "fa-arrow-down";
        }
        return "fa-arrow-up";
    }
    public String getCssClass(){
        if(evolution<0){
            return "text-danger";
        }
        return "text-success";
    }
    public String getBeneficeString(){
        StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("[");
        for (int i = 0; i < benefice.length; i++) {
            jsonBuilder.append(benefice[i].getValeur());
            
            if (i < benefice.length - 1) {
                jsonBuilder.append(",");
            }
        }
        jsonBuilder.append("]");
        return jsonBuilder.toString();
    }

    public Benefice getBenefice(int monthIndex) throws Exception{
        for (int i = 0; i < benefice.length; i++) {
            if(benefice[i].getMois() == monthIndex){
                return benefice[i];
            }
        }
        return null;
    }
    

    
    public double getEvolution(Connection connect) throws Exception{
        int monthIndex = Util.getCurrentMonth();
        Benefice now = getBenefice(monthIndex);
        Benefice before = getBenefice(monthIndex-1);
        if(before == null){
            before = new Benefice();
            before.setMois(12);
            before.setAnnee(Util.getCurrentYear()-1);
            if(before.getBenefice(connect) == false){
                System.out.println("1");
                return 1;
            }
        }
        if(before.getValeur() == 0){
            return now.getValeur()/Math.abs(now.getValeur());
        }
        System.out.println(now.getValeur()-before.getValeur()/before.getValeur());
        return (now.getValeur()-before.getValeur())/before.getValeur();
    }
    public String getEvolutionPourcentage(){
        double number= evolution*100;
        String formattedNumber = Util.format(number);
        return formattedNumber;
    }
    public StatistiqueFinance(Connection connect) throws Exception{
        boolean opened = false;
        if(connect == null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        try{
            this.setBenefice(Benefice.getBeneficeCetteAnnee(connect));
            this.setCaisse(Caisse.getDefaultCaisseNow(connect));
            this.setEvolution(getEvolution(connect));
        }
        catch (Exception e) {
            throw e;
        }
        finally{
            if(opened){
                connect.close();
            }
        }
    }
    public Benefice[] getBenefice() {
        return benefice;
    }
    public void setBenefice(Benefice[] benefice) {
        this.benefice = benefice;
    }
    public Caisse getCaisse() {
        return caisse;
    }
    public void setCaisse(Caisse caisse) {
        this.caisse = caisse;
    }

    public double getEvolution() {
        return evolution;
    }

    public void setEvolution(double evolution) {
        this.evolution = evolution;
    }
    
    
}
