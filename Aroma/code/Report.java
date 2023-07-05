package assets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.LinkedList;
import utils.MaConnection;
import utils.Constantes;
import utils.Constantes2;

public class Report{
    private int id;
    LocalDateTime date;
    double valeur;
    Transaction[] liste_Transactions;
    
    public Report() {
    }
    public Report(int id, LocalDateTime date, double valeur) {
        this.id = id;
        this.date = date;
        this.valeur = valeur;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public LocalDateTime getDate() {
        return date;
    }
    public String getDateString(){
        return getDate().toLocalDate().toString()+" "+getDate().toLocalTime().toString();
    }
    public Timestamp getDateSql(){
        return Timestamp.valueOf(getDate());
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }
    public void setDate(Timestamp date){
        setDate(date.toLocalDateTime());
    }
    public void setDate(String datereport, String heurereport){
        setDate(LocalDateTime.of(LocalDate.parse(datereport), LocalTime.parse(heurereport)));
    }

    public double getValeur() {
        return valeur;
    }

    public void setValeur(double valeur) {
        this.valeur = valeur;
    }
    public void setValeur(String valeur){
        setValeur(Double.parseDouble(valeur));
    }

    public Transaction[] getListe_Transactions() {
        return liste_Transactions;
    }

    public void setListe_Transactions(Transaction[] liste_Transactions) {
        this.liste_Transactions = liste_Transactions;
    }

    public static Report dernierReport( Connection connex ) throws Exception{
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        String requete = "  select "+Constantes.col_id_report+", "+Constantes.col_valeur_report+" ,  "+Constantes.col_date_report+" from "+Constantes.view_dernier_report;
        PreparedStatement statemnt=connect.prepareStatement(requete);
        try{
            Report dernier_report = new Report(0, LocalDateTime.now(), 0);
            dernier_report.setListe_Transactions(new Transaction[0]);
            ResultSet result=statemnt.executeQuery();
            if(result.next()){
                dernier_report.setId(result.getInt(Constantes.col_id_report));
                dernier_report.setValeur(result.getDouble(2));
                dernier_report.setDate(result.getTimestamp(3));
                dernier_report.setListe_Transactions(dernier_report.getListeTransaction(connect));
            }
            return dernier_report;
        }finally{
            statemnt.close();
            if(opened){
                connect.close();
            }
        }
    }
    public static Report[] getAllReports(Connection connex, boolean avecTransactions) throws Exception{
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        String query="select "+Constantes.col_id_report+", "+Constantes.col_valeur_report+", "+Constantes2.col_date_report+
                        " from "+Constantes.table_report;
        PreparedStatement statement=connect.prepareStatement(query);
        try{
            ResultSet results=statement.executeQuery();
            LinkedList<Report> liste=new LinkedList<>();
            while(results.next()){
                Report report=new Report();
                report.setId(results.getInt(Constantes.col_id_report));
                report.setDate(results.getTimestamp(Constantes.col_date_report));
                report.setValeur(results.getDouble(Constantes.col_valeur_report));
                if(avecTransactions){
                    report.setListe_Transactions(report.getListeTransaction(connect));
                }
                liste.add(report);
            }
            Report[] reports=new Report[liste.size()];
            for(int i=0; i<reports.length; i++){
                reports[i]=liste.get(i);
            }
            return reports;
        }finally{
            statement.close();
            if(opened){
                connect.close();
            }
        }
    }

    public Transaction[] getListeTransaction(Connection connex) throws Exception{
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        String requete = " select "+Constantes.col_numero_transaction+" , "+Constantes.col_description_transaction+" , "+
                                    Constantes.col_date_transaction+" , "+Constantes.col_entree_transaction+" , "+
                                    Constantes.col_sortie_transaction+" from "+Constantes.table_transaction+
                                    " where  "+Constantes.col_date_transaction+" between ? and  now() order by "+Constantes.col_date_transaction+" desc ";
        PreparedStatement statemnt=connect.prepareStatement(requete);
        try{
            statemnt.setTimestamp(1, getDateSql());
            ArrayList<Transaction> liste=new ArrayList<>();
            ResultSet result=statemnt.executeQuery();
            while(result.next()){
                Transaction transaction=new Transaction();
                transaction.setNumero_transaction(result.getInt(1));
                transaction.setDescription(result.getString(2));
                transaction.setDate(result.getTimestamp(3).toLocalDateTime());
                transaction.setEntree(result.getDouble(4));
                transaction.setSortie(result.getDouble(5));
                liste.add(transaction);
            }
            Transaction[] transactions=new Transaction[liste.size()];
            for(int i=0; i<transactions.length; i++){
                transactions[i]=liste.get(i);
            }
            return transactions;
        }finally{
            statemnt.close();
            if(opened){
                connect.close();
            }
        }
    }
    public void save(Connection connex) throws Exception{
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        String query="insert into report values(default, ?, ?)";
        PreparedStatement statement=connect.prepareStatement(query);
        try {
            statement.setDouble(1, getValeur());
            statement.setTimestamp(2, getDateSql());
            statement.executeUpdate();
            if(opened){
                connect.commit();
            }
        } catch (Exception e) {
            connect.rollback();
            throw e;
        }finally{
            statement.close();
            if(opened){
                connect.close();
            }
        }
    }
}