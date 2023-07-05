package assets;

import java.sql.Connection;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import utils.Constantes;
import utils.MaConnection;
import assets.MatierePremiere;
import java.sql.PreparedStatement;
public class EnleverMatieresPremieres {
    MatierePremiere produit;
    double quantite; 
    LocalDateTime date;

    public EnleverMatieresPremieres(MatierePremiere produit, double quantite, LocalDateTime date) {
        this.produit = produit;
        this.quantite = quantite;
        this.date = date;
    }

    public void insert(Connection connect) throws Exception{
        boolean opened = false;
        if(connect == null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        String requete = "insert into mouvementproduit (idproduit,date,quantite_en_moins) values (?,?,?)";
        PreparedStatement pstmt = connect.prepareStatement(requete);

        pstmt.setInt(1, produit.getId());
        pstmt.setTimestamp(2, Timestamp.valueOf(date));
        pstmt.setDouble(3, quantite);
        try {
            pstmt.executeUpdate();
            if(opened){
                connect.commit();
            }

        } catch (Exception e) {
            if(opened){
                connect.rollback();
                throw e;
            }
        }
        finally{
            pstmt.close();
            if(opened){
                connect.close();
            }
        }
    }
}
