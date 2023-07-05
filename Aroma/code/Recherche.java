package assets;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import utils.Constantes;

public class Recherche {
    LocalDateTime date_debut;
    LocalDateTime date_fin;
    
    public Recherche() {
    }
    public LocalDateTime getDate_debut() {
        return date_debut;
    }
    public Timestamp getDate_debutSql(){
        if(getDate_debut()!=null){
            Timestamp date=Timestamp.valueOf(getDate_debut());
            return date;
        }
        return Timestamp.valueOf(LocalDateTime.now());
    }
    public void setDate_debut(LocalDateTime date_debut) {
        this.date_debut = date_debut;
    }
    public void setDate_debut(String mois, String annee){
        LocalDate datedebut=LocalDate.of(Integer.parseInt(annee), Integer.parseInt(mois), 1);
        LocalDateTime debut=LocalDateTime.of(datedebut, LocalTime.parse("00:00"));
        setDate_debut(debut);
    }
    public LocalDateTime getDate_fin() {
        return date_fin;
    }
    public Timestamp getDate_finSql(){
        LocalDateTime finSql=getDate_fin();
        if(finSql!=null){
            return Timestamp.valueOf(getDate_fin());
        }
        return null;
    }
    public void setDate_fin(LocalDateTime date_fin) {
        this.date_fin = date_fin;
    } 
}
