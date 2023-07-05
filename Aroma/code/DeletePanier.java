package servlet.vente;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import assets.produit.FicheProduit;
import assets.produit.ProduitFini;
import servlet.vente.*;

public class DeletePanier extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException, Exception {
        PrintWriter out = res.getWriter();
        try {
            String idPanierStr = req.getParameter("idPanier");
            int idPanier = Integer.parseInt(idPanierStr);

            HttpSession session = req.getSession(false); // Ne crée pas de nouvelle session si elle n'existe pas
            if (session != null) {
                // Supprimer l'élément spécifique de la listePanier
                List<Panier> listePanier = (List<Panier>) session.getAttribute("listePanier");
                if (listePanier != null && !listePanier.isEmpty()) {
                    Iterator<Panier> iterator = listePanier.iterator();
                    while (iterator.hasNext()) {
                        Panier panier = iterator.next();
                        out.println(panier.getProduitFini().getId());
                        out.println(idPanier);
                        if (panier.getProduitFini().getId() == idPanier) {
                            iterator.remove(); // Supprimer l'élément de la listePanier
                            break;
                        }
                    }
                }
            }


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
