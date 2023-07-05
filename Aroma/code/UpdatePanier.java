package servlet.vente;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import servlet.vente.Panier;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Iterator;

public class UpdatePanier extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException, Exception {
        PrintWriter out = res.getWriter();
        try {

            String[] idPanierArray = req.getParameterValues("idPanier[]");
            String[] quantiteArray = req.getParameterValues("quantite[]");
            
            if (idPanierArray != null && quantiteArray != null) {
                int[] idPanierInts = new int[idPanierArray.length];
                int[] quantiteInts = new int[quantiteArray.length];
            
                for (int i = 0; i < idPanierArray.length; i++) {
                    quantiteInts[i] = Integer.parseInt(quantiteArray[i]);
                    idPanierInts[i] = Integer.parseInt(idPanierArray[i]);

                    if (idPanierArray != null && quantiteArray != null) {
                        // Par exemple :
                        out.println("Tena metyyy kyyy annnnn");
                        out.println("Taille panier = "+idPanierArray.length);
                        out.println("Taille quantite = "+quantiteArray.length);
        
                        for(int j = 0; j < idPanierArray.length; j++) {
                            HttpSession session = req.getSession(false);
                            if( session != null ) {
                                //Supprimer l'élément spécifique de la listePanier
                                List<Panier> listePanier = (List<Panier>) session.getAttribute("listePanier");
                                if (listePanier != null && !listePanier.isEmpty()) {
                                    Iterator<Panier> iterator = listePanier.iterator();
                                    while (iterator.hasNext()) {
                                        Panier panier = iterator.next();
                                        if(panier.getProduitFini().getId() == idPanierInts[j]) {
                                            panier.setQuantite(quantiteInts[j]);
                                            double prixProduits = panier.getProduitFini().getPrix() * panier.getQuantite();
                                            panier.setPrixProduit(prixProduits);
                                            break;
                                        }
                                    }
                                }
                            }
                        }
        
                    } else {
                        // Par exemple :
                        out.println("Les tableaux idPanierArray et quantiteArray sont nuls.");
                    }
                }
            
                // Maintenant vous avez les tableaux idPanierInts et quantiteInts qui contiennent les valeurs converties en entiers
                // Vous pouvez les utiliser dans votre fonction Java
            } else {
                // Gérez le cas où les tableaux sont nuls
            }
        


            // HttpSession session = req.getSession(false); // Ne crée pas de nouvelle session si elle n'existe pas
            // if (session != null) {
            //     // Supprimer l'élément spécifique de la listePanier
            //     List<Panier> listePanier = (List<Panier>) session.getAttribute("listePanier");
            //     if (listePanier != null && !listePanier.isEmpty()) {
            //         Iterator<Panier> iterator = listePanier.iterator();
            //         while (iterator.hasNext()) {
            //             Panier panier = iterator.next();
            //             out.println(panier.getProduitFini().getId());
            //             out.println(idPanier);
            //             if(panier.getProduitFini().getId() == idPanier ) {
            //                 panier.setQuantite(quantite);
            //                 double prixProduit = panier.getProduitFini().getPrix() * panier.getQuantite();
            //                 panier.setPrixProduit(prixProduit);
            //                 break;
            //             }
            //         }
            //     }
            // }

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
