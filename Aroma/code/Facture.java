package servlet.vente;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.MaConnection;
import utils.Constantes;
import servlet.vente.Client;

public class Facture {
    int idFacture;
    Client client;
    FactureFille[] factures;
    
    public int getIdFacture() {
        return idFacture;
    }
    public void setIdFacture(int idFacture) {
        this.idFacture = idFacture;
    }
    public Client getClient() {
        return client;
    }
    public void setClient(Client client) {
        this.client = client;
    }
    public FactureFille[] getFactures() {
        return factures;
    }
    public void setFactures(FactureFille[] factures) {
        this.factures = factures;
    }

    public Facture(int idFacture, Client client, FactureFille[] factures) {
        this.idFacture = idFacture;
        this.client = client;
        this.factures = factures;
    }

    public Facture() {
    }

    public void insertFacture(Connection co,int idClient) throws Exception{
        Connection connex = co;
        boolean opened = false;

        if (connex==null) {
            connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened = true;
        }

        try {
            String query = "INSERT INTO Facture (idClient, date) VALUES (?, CURRENT_DATE)";

            PreparedStatement stmt = connex.prepareStatement(query);
            stmt.setInt(1, idClient);

            stmt.executeQuery();
        } catch (Exception e) {

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
            String query = "SELECT max(idfacture) as id from facture";
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

    public void confirmer (Connection co,String nom,String numero,String adresse,int[] idProduits,int[] quantites) throws Exception{
        Client c = new Client();
        c.insertClient(co, nom, numero, adresse);
        int idClient = c.getId(co);
        Facture f = new Facture();
        f.insertFacture(co, idClient);
        int idFacture = f.getId(co);
        FactureFille ff = new FactureFille();
        for (int i = 0; i < idProduits.length; i++) {
            for (int j = 0; j < quantites.length; j++) {
                ff.insertFactureFille(co, idFacture, idProduits[i], quantites[j]);
            }
        }
    }
    
}
