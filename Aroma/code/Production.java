package assets;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import utils.Constantes;
import utils.MaConnection;
import assets.*;
import assets.produit.*;
import location.Entrepot;
public class Production {
    int id;
    ProduitFini produit;
    double quantite;
    LocalDateTime date;
    Entrepot entrepot;


    public void produire(Connection connect ) throws Exception{
        boolean opened = false;
        if(connect == null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        try {
            this.insert(connect);
            this.insertEntrepot(connect);
            for (int i = 0; i < this.produit.getMatieres_premieres().length; i++) {
                EnleverMatieresPremieres e = new EnleverMatieresPremieres(produit.getMatieres_premieres()[i], quantite*produit.getMatieres_premieres()[i].getQuantite_utile(), this.getDate());
                e.insert(connect);
            }
            if(opened){
                connect.commit();
            }
        } catch (Exception e) {
            if(opened){
                connect.commit();
            }
            throw e;
        }
        finally{
            if(opened){
                connect.close();
            }
        }
    }
   
    public Production(String produit, String quantite, String date, String entrepot, Connection con) throws Exception{
        setDate(date);
        setProduit(new ProduitFini(produit,1));
        setEntrepot(new Entrepot(entrepot));
        setQuantite(quantite);
        boolean opened = false;
        if(con == null){
            con=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened = true;
        }
        try {
            if(Produit.getProduitById(getProduit().getId(), con) == null){
                throw new Exception("Produit invalide ou n'existe pas");
            }
            if(getEntrepot().getEntreportById(con) == false){
                throw new Exception("Entrepot invalide ou n'existe pas");
            }
            
            Produit insuffisant = getProduit().haveEnoughStock(getQuantite(), con);
            if(insuffisant != null){
                throw new Exception("Stock de "+insuffisant.getNom()+" insuffisant");
            }
        } catch (Exception e) {
            throw e;
        }
        finally{
            if(opened){
                con.close();
            }
        }

    }

    public void insertEntrepot(Connection connect) throws Exception{
        boolean opened = false;
        if(connect == null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        String requete = "insert into mouvementproduit_entrepot (idmouvementproduit,identrepot) values (?,?)";
        PreparedStatement pstmt = connect.prepareStatement(requete);

        pstmt.setInt(1, this.getId());
        pstmt.setInt(2, this.entrepot.getIdentrepot());
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
    public void insert(Connection connect) throws Exception{
        boolean opened = false;
        if(connect == null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        String requete = "insert into mouvementproduit (idproduit,date,quantite_en_plus) values (?,?,?) returning idmouvementproduit";
        PreparedStatement pstmt = connect.prepareStatement(requete);

        pstmt.setInt(1, produit.getId());
        pstmt.setTimestamp(2, Timestamp.valueOf(date));
        pstmt.setDouble(3, quantite);
        try {
            ResultSet res = pstmt.executeQuery();
            res.next();

            this.id = res.getInt("idmouvementproduit");
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

    
    public void setQuantite(String quantite) throws Exception {
        setQuantite(Double.valueOf(quantite));
    }
    public void setDate(String date) throws Exception{
        // DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        try {
            LocalDateTime date_production = LocalDateTime.parse(date);
            setDate(date_production);
        } catch (Exception e) {
            throw new Exception("Date de production non valide");
        }        
    }
    public ProduitFini getProduit() {
        return produit;
    }
    public void setProduit(ProduitFini produit) {
        this.produit = produit;
    }
    public double getQuantite() {
        return quantite;
    }
    public void setQuantite(double quantite) throws Exception{
        if(quantite<0){
            throw new Exception("Quantite de production invalide");
        }
        this.quantite = quantite;
    }
    public LocalDateTime getDate() {
        return date;
    }
    public void setDate(LocalDateTime date) {
        this.date = date;
    }
    public Entrepot getEntrepot() {
        return entrepot;
    }
    public void setEntrepot(Entrepot entrepot) {
        this.entrepot = entrepot;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
}
