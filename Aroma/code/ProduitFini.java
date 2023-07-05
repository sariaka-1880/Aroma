package assets.produit;
import utils.Constantes;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import com.google.gson.Gson;

import assets.MatierePremiere;
import assets.Produit;
import utils.*;
public class ProduitFini extends Produit {
    // private int idproduit_fini;
    // private String nom;
    private int quantite;
    private Date date;
    private double prix;
    private FicheProduit ficheProduit;
    double rendement;
    MatierePremiere[] matieres_premieres;
    HashMap<String ,StatistiqueProduitFini> statistique = new HashMap<String ,StatistiqueProduitFini>();
    
    public ProduitFini(String id, String nom, String rendement) {
        setId( id );
        setNom( nom );
        setRendement( rendement );
    }
    public MatierePremiere[] getMatieres_premieres() {
        return matieres_premieres;
    }
    public double getRendement() {
        return rendement;
    }
    public void setMatieres_premieres(MatierePremiere[] matieres_premieres) {
        this.matieres_premieres = matieres_premieres;
    }
    public HashMap<String, StatistiqueProduitFini> getStatistique() {
        return statistique;
    }
    public void setStatistique(HashMap<String, StatistiqueProduitFini> statistique) {
        this.statistique = statistique;
    }
    public double getPrix() {
        return prix;
    }
    public void setPrix(double prix) {
        this.prix = prix;
    }
    public int getQuantite() {
        return quantite;
    }
    public FicheProduit getFicheProduit() {
        return ficheProduit;
    }
    public void setFicheProduit(FicheProduit ficheProduit) {
        this.ficheProduit = ficheProduit;
    }
    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
    // public int getId() {
    //     return idproduit_fini;
    // }
    // public void setId(int idproduit_fini) {
    //     this.idproduit_fini = idproduit_fini;
    // }
    // public String getNom() {
    //     return nom;
    // }
    // public void setNom(String nom) {
    //     this.nom = nom;
    // }

    public ProduitFini(int id, String nom) {
        super(id,nom);
    }
    public ProduitFini(int id, String nom,double rendement) {
        super(id,nom);
        setRendement(rendement);
    }

    public int[] getIdProducts(Connection co) {
        Connection connex = co;
        boolean opened = false;
        int[] id = null; // Initialisez la variable id avec une valeur par défaut (null dans ce cas)

        if (connex == null) {
            try {
                connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
                opened = true;
            } catch (Exception exp) {
                System.out.println(exp.getMessage());
            }
        }

        try {
            String query1 = "SELECT idproduit FROM produit WHERE idtypeproduit = 4";
            PreparedStatement stmt = connex.prepareStatement(query1);
            ResultSet rs = stmt.executeQuery();
            List<Integer> listId = new ArrayList<>();
            while (rs.next()) {
                int productId = rs.getInt("idproduit"); // Utilisez getInt() pour récupérer un entier depuis le ResultSet
                listId.add(productId);
            }
            id = new int[listId.size()];
            for (int i = 0; i < listId.size(); i++) {
                id[i] = listId.get(i);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (opened && connex != null) {
                try {
                    connex.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return id;
    }


    public static ArrayList<ProduitFini> getListProduitFini(Connection co) {
        Connection connex = co;
        boolean opened = false;
        ArrayList<ProduitFini> produitFinis = new ArrayList<ProduitFini>();

        if (connex == null) {
            try {
                connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
                opened = true;
            } catch (Exception exp) {
                System.out.println(exp.getMessage());
            }
        }

        try {
            String requete = "SELECT DISTINCT idproduit, nom_produit , prix FROM v_produits";
            PreparedStatement statemnt=connex.prepareStatement(requete);
            ResultSet results = statemnt.executeQuery();
            
            while(results.next()) {
                ProduitFini produitFini = new ProduitFini();
                produitFini.setId(results.getInt(1));
                produitFini.setNom(results.getString(2));
                produitFini.setPrix(results.getDouble(3));
                produitFinis.add(produitFini);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (opened && connex != null) {
                try {
                    connex.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return produitFinis;
    }


    public static ArrayList<ProduitFini> getListProduitFiniById(Connection co , int idproduit_Fini) {
        Connection connex = co;
        boolean opened = false;
        ArrayList<ProduitFini> produitFinis = new ArrayList<ProduitFini>();

        if (connex == null) {
            try {
                connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
                opened = true;
            } catch (Exception exp) {
                System.out.println(exp.getMessage());
            }
        }

        try {
            String requete = "SELECT DISTINCT idproduit, nom_produit , prix FROM v_produits where idproduit = "+idproduit_Fini;
            PreparedStatement statemnt=connex.prepareStatement(requete);
            ResultSet results = statemnt.executeQuery();
            
            while(results.next()) {
                ProduitFini produitFini = new ProduitFini();
                produitFini.setId(results.getInt(1));
                produitFini.setNom(results.getString(2));
                produitFini.setPrix(results.getDouble(3));
                produitFinis.add(produitFini);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (opened && connex != null) {
                try {
                    connex.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return produitFinis;
    }

    public static ProduitFini[] getAllProduitFini(Connection connect) throws Exception{
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }

        PreparedStatement statemnt=connect.prepareStatement("select * from "+Constantes.view_produit_fini);
        try {
            ResultSet results = statemnt.executeQuery();
            Vector<ProduitFini> liste = new Vector<ProduitFini>();
            while(results.next()){
                liste.add(new ProduitFini(results.getInt(Constantes.col_id_produit),results.getString(Constantes.col_nom_produit)));
            }
            return liste.toArray(new ProduitFini[0]);
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

    public MatierePremiere[] getMatieresPremieres(Connection connect) throws Exception{
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        String requete = "select "+Constantes.col_id_matieres_premieres+","+Constantes.col_nom_produit+","+Constantes.col_quantite_utile+" from "+Constantes.table_produitfinis_matieres_premieres+" join "+Constantes.table_produit+" on "+Constantes.table_produit+"."+Constantes.col_id_produit +" = "+Constantes.table_produitfinis_matieres_premieres+"."+Constantes.col_id_matieres_premieres+" where "+Constantes.col_id_produit_fini+" = "+this.id;

        System.out.println(requete);
        PreparedStatement statement=connect.prepareStatement(requete);
        try {
            Vector<MatierePremiere> liste = new Vector<MatierePremiere>();
            ResultSet result=statement.executeQuery();
            while(result.next()){
                liste.add(new MatierePremiere(result.getInt(Constantes.col_id_matieres_premieres),result.getString(Constantes.col_nom_produit), result.getDouble(Constantes.col_quantite_utile)));
            }
            return liste.toArray(new MatierePremiere[0]);
        }catch(Exception e){
            connect.rollback();
            throw e;
        } finally {
            statement.close();
            if(opened){
                connect.close();
            }
        }
    }
     
    public Produit haveEnoughStock(double quantite, Connection con) throws Exception{
        setMatieres_premieres(getMatieresPremieres(con));

        double stock = 0.;
        double besoin = 0.;
        for (int i = 0; i < matieres_premieres.length; i++) {
            stock = matieres_premieres[i].getQuantiteEnStock(con);
            besoin = matieres_premieres[i].getQuantite_utile()*quantite;
            if(stock < besoin){
                return matieres_premieres[i];
            }
        }
        return null;
    } 

    public ProduitFini(String nom) {
        setNom( nom );
    }

    public ProduitFini() {
    }

    public int getid() {
        return id;
    }

    public static  ProduitFini[] getRendement_par_entrepot( )throws Exception{
        return getRendement_par_entrepot(null);
    }

    public String toJson(){
        Gson gson = new Gson();
        String json = gson.toJson(this);
        return json;
    }

    public static String toJson( ProduitFini[] l_p ){
        Gson gson = new Gson();
        String json = gson.toJson(l_p);
        return json;
    }

    public static ProduitFini[] getRendement_par_entrepot_annee(Connection connex) throws Exception {
        Connection connect = connex;
        boolean opened = false;
        if (connect == null) {
            connect = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened = true;
        }
        String requete = "SELECT nom_produit, nom_mois, annee, rendement_mois FROM v_rendement_mois_entrepot_all order by nom_produit";
        System.out.println(requete);
        PreparedStatement statement = connect.prepareStatement(requete);
        try {
            Vector<ProduitFini> listes_produits_finis = new Vector<ProduitFini>();
            ResultSet result = statement.executeQuery();
            String nom_produit = "";ProduitFini tempo = null;
            while (result.next()) {
                //niova
                System.out.println(" comparaison : "+nom_produit+" / "+result.getString("nom_produit")+" ");
                if( nom_produit.compareToIgnoreCase(result.getString("nom_produit")) != 0 ){
                    tempo = new ProduitFini(result.getString("nom_produit"));
                    listes_produits_finis.add(tempo);
                }
                StatistiqueProduitFini statistique = new StatistiqueProduitFini();
                statistique.setMois(result.getString("nom_mois"));
                statistique.setAnnee(result.getInt("annee"));
                statistique.setRendement_mois(result.getDouble("rendement_mois"));
                tempo.getStatistique().put( result.getString("nom_mois") , statistique );
                nom_produit = result.getString("nom_produit");
            }
    
            return listes_produits_finis.toArray(new ProduitFini[listes_produits_finis.size()]);
        } catch (Exception e) {
            connect.rollback();
            throw e;
        } finally {
            statement.close();
            if (opened) {
                connect.close();
            }
        }
    }
    

    public static  ProduitFini[] getRendement_par_entrepot( Connection connex )throws Exception{
        Connection connect=connex;
        boolean opened=false;
        if(connect==null){
            connect=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            opened=true;
        }
        String requete = " select * from "+Constantes.view_rendement_produit_fini_par_jour;
        System.out.println(requete);
        PreparedStatement statement=connect.prepareStatement(requete);
        try {
            Vector<ProduitFini> listes_produits_finis = new Vector<ProduitFini>();
            ResultSet result=statement.executeQuery();
            while(result.next()){
                ProduitFini tempo = new ProduitFini( result.getString( "idproduit" ) , result.getString( "nom_produit" ) , result.getString( "moyenne_production" )   );
                listes_produits_finis.add( tempo );
            }

            return listes_produits_finis.toArray( new ProduitFini[listes_produits_finis.size()] );
        }catch(Exception e){
            connect.rollback();
            throw e;
        } finally {
            statement.close();
            if(opened){
                connect.close();
            }
        }
    }
    public ProduitFini(String id, int diff) throws Exception{
        super();
        setId(id);
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public void setId(String id) {
        if( id != null )
            setId( Integer.valueOf( id ) );
    }

    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        System.out.println(" nom avant :  "+nom);
        this.nom = nom.replace("\\u0027", "'");;
        System.out.println(" nom apres :  "+getNom());
    }
    

    public String getRendementString(){
        if( getRendement() != 0 )
            return getRendement()+" Flacons ";
        return " Aucun Flacon ";
    }
    public void setRendement(String rendement) {
        if( rendement != null )
            setRendement( Double.valueOf( rendement ) );
    }
    public void setRendement(double rendement) {
        this.rendement = rendement;
    }
    @Override
    public String toString() {
        return "ProduitFini [rendement=" + rendement + ", matieres_premieres=" + Arrays.toString(matieres_premieres)
                + ", statistique=" + statistique + "]";
    }



}
