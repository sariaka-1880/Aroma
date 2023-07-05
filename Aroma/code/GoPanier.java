package servlet.vente;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import utils.MaConnection;
import assets.produit.FicheProduit;
import assets.produit.ProduitFini;
import servlet.vente.*;
import java.sql.Connection;
import utils.*;

public class GoPanier extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException, Exception {
        PrintWriter out = res.getWriter();
        try {
            String idProduit = req.getParameter("idProduit");
            int id = Integer.parseInt(idProduit);
            out.println(id);

            Connection connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);

            // Vérifier si la session "listePanier" existe déjà
            HttpSession session = req.getSession();
            List<Panier> listePanier = (List<Panier>) session.getAttribute("listePanier");

            if (listePanier == null) {
                // Si la session n'existe pas, créer une nouvelle liste de paniers
                listePanier = new ArrayList<>();
            } else {
                // Si la session existe, récupérer la listePanier existante
                listePanier = (List<Panier>) session.getAttribute("listePanier");
            }

            ProduitFini produitFini = new ProduitFini();
            produitFini.setId(id);

            FicheProduit fiche = new FicheProduit();
            ArrayList<FicheProduit> listfiche = fiche.getListFicheProduits(connex, id);

            for (int b = 0; b < listfiche.size(); b++) {
                String[] vertu = listfiche.get(b).getVertu();
                fiche.setVertu(vertu);
            }
            produitFini.setFicheProduit(fiche);

            Panier panier = new Panier();
            panier.setProduitFini(produitFini);
            panier.setQuantite(1);


            double prixProduit = 0;
            ArrayList<ProduitFini> listProduit = produitFini.getListProduitFiniById(connex, id);

            for (int j = 0; j < listProduit.size(); j++) {
                produitFini.setNom(listProduit.get(j).getNom());
                produitFini.setPrix(listProduit.get(j).getPrix());
                prixProduit = produitFini.getPrix() * panier.getQuantite();
            }
            panier.setPrixProduit(prixProduit);

            // Ajouter le panier à la listePanier
            listePanier.add(panier);

            // Mettre à jour la session avec la nouvelle listePanier
            session.setAttribute("listePanier", listePanier);


            RequestDispatcher dispat = getServletContext().getRequestDispatcher("/panier.jsp");
            dispat.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        try {
            processRequest(req, res);
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        try {
            processRequest(req, res);
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
}
