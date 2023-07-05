import java.sql.Connection;
import java.util.ArrayList;

import utils.Constantes;
import utils.MaConnection;
import assets.produit.ProduitFini;
import assets.produit.FicheProduit;
import servlet.vente.Client;


public class Test {
    public static void main(String[] args)  {

        try {
            Connection connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            if( connex != null) {
                // ProduitFini produitFinis = new ProduitFini();
                // ArrayList<ProduitFini> listproduitFinis = produitFinis.getListProduitFini(connex);
                // for(int i = 0; i < listproduitFinis.size(); i++) {
                //     System.out.println(listproduitFinis.get(i).getNom());
                //     System.out.println(listproduitFinis.get(i).getId());
                // }

                FicheProduit fiche = new FicheProduit();
                ArrayList<FicheProduit> listphoto = fiche.getListFicheProduitsPhoto(connex,7);
                for(int j = 0; j < listphoto.size(); j++) {
                    String[] photo = listphoto.get(j).getImage();
                    for(int a = 0;  a < photo.length; a++) {
                        System.out.println("photo "+a+" : "+photo[a]);
                    }
                }
            }
            Client c = new Client();
            c.insertClient(connex, "Vola", "telma eh", "trano");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
