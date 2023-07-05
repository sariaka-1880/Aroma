package servlet.production;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import location.Entrepot;
import assets.*;
import java.io.*;
import assets.produit.*;
public class AjoutProductionEntreeServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if(req.getParameter("erreur")!=null){
                req.setAttribute("erreur",req.getParameter("erreur"));
            }
            Entrepot[] entrepots = Entrepot.getAllEntrepots(null);
            ProduitFini[] pf = ProduitFini.getAllProduitFini(null);
            req.setAttribute("entrepots", entrepots);
            req.setAttribute("produits", pf);
            RequestDispatcher dispat = req.getRequestDispatcher("/ajout_production.jsp");
            dispat.forward(req,resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
