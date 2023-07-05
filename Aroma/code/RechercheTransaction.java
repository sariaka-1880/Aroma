package assets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import utils.MaConnection;
import utils.Constantes;

public class RechercheTransaction extends Recherche{
    Transaction[] liste;
    public RechercheTransaction(LocalDateTime date_debut, LocalDateTime date_fin) throws Exception {
        super();
        setDate_debut(date_debut);
        setDate_fin(date_fin);
        setListe(getAllTransaction(null));
    }
    public RechercheTransaction(LocalDateTime date_debut, LocalDateTime date_fin, Connection connex) throws Exception {
        super();
        setDate_debut(date_debut);
        setDate_fin(date_fin);
        setListe(getAllTransaction(connex));
    }

    //si datefin et datedebut null de toade izy rehetra ny apotra
    public Transaction[] getAllTransaction(Connection connex) throws Exception{
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        String sql = "select "+Constantes.col_numero_transaction+","+Constantes.col_description_transaction+","+
                                Constantes.col_entree_transaction+","+Constantes.col_sortie_transaction+
                                ", "+Constantes.col_date_transaction+" from "+Constantes.table_transaction;
        String sqlBetween=" where "+Constantes.col_date_transaction+
                                " between ? and ?";
        String sqlOrderBy=" order by "+Constantes.col_date_transaction+" desc";
        // if(getDate_finSql()==null){
        //     sqlBetween=" where "+Constantes.col_date_transaction+"<? and "+Constantes.col_date_transaction+" >= ?";
        // }
        if(getDate_debutSql()!=null){
            sql+=sqlBetween;
        }
        sql+=sqlOrderBy;
        // System.out.println(sql);
        PreparedStatement statemnt=connect.prepareStatement(sql);
        if(getDate_debutSql()!=null){
            statemnt.setTimestamp(1, getDate_debutSql());
            if(getDate_finSql()==null){
                statemnt.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            }else{
                statemnt.setTimestamp(2, getDate_finSql());
            }
        }
        try{
            ArrayList<Transaction> liste=new ArrayList<>();
            ResultSet result=statemnt.executeQuery();
            while(result.next()){
                Transaction transaction=new Transaction();
                transaction.setNumero_transaction(result.getInt(1));
                transaction.setDescription(result.getString(2));
                transaction.setEntree(result.getDouble(3));
                transaction.setSortie(result.getDouble(4));
                transaction.setDate(result.getTimestamp(5).toLocalDateTime());
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


    public Transaction[] getListe() {
        return liste;
    }

    public void setListe(Transaction[] liste) {
        this.liste = liste;
    }


}
