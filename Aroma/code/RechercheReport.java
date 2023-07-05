package assets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import utils.MaConnection;
import utils.Constantes;

public class RechercheReport extends Recherche{

    Report[] liste;
    
    public RechercheReport() {
        super();
    }
    public RechercheReport(LocalDateTime date_debut, LocalDateTime date_fin) throws Exception {
        super();
        setDate_debut(date_debut);
        setDate_fin(date_fin);
        setListe(getAllReport(null));
    }
    public RechercheReport(LocalDateTime date_debut, LocalDateTime date_fin, Connection connex) throws Exception {
        super();
        setDate_debut(date_debut);
        setDate_fin(date_fin);
        setListe(getAllReport(connex));
    }

    //si datefin et datedebut null de toade izy rehetra ny apotra
    public Report[] getAllReport(Connection connex) throws Exception{
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        String sql = "select "+Constantes.col_id_report+", "+Constantes.col_valeur_report+","+Constantes.col_date_report+" from "+Constantes.table_report+" where "+Constantes.col_date_report+" between ? and ? order by "+Constantes.col_date_report+" desc";
        PreparedStatement statemnt=connect.prepareStatement(sql);
        statemnt.setTimestamp(1, getDate_debutSql());
        if(getDate_fin()!=null){
            statemnt.setTimestamp(2, getDate_finSql());
        }else{
            statemnt.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
        }
        try{
            ArrayList<Report> liste=new ArrayList<>();
            ResultSet result=statemnt.executeQuery();
            while(result.next()){
                Report report=new Report();
                report.setId(result.getInt(Constantes.col_id_report));
                report.setValeur(result.getDouble(2));
                report.setDate(result.getTimestamp(3));
                liste.add(report);
            }
            Report[] reports=new Report[liste.size()];
            for(int i=0; i<reports.length; i++){
                reports[i]=liste.get(i);
            }
            return reports;
        }finally{
            statemnt.close();
            if(opened){
                connect.close();
            }
        }
    }

    public Report[] getListe() {
        return liste;
    }

    public void setListe(Report[] liste) {
        this.liste = liste;
    }


}
