package servlet.production;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import location.Entrepot;
import assets.*;
import assets.produit.*;

import java.io.*;
public class AjoutProductionSubmitServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String contextPath = request.getContextPath();
            String newLocation = contextPath + "/production/ajout";
        try {
            Production p = new Production(request.getParameter("produit"), request.getParameter("quantite"),request.getParameter("date"),request.getParameter("entrepot"),null);
            p.produire(null);
            
        } catch (Exception e) {
            newLocation = newLocation+"?erreur="+e.getMessage();
            
        }
        finally{
            resp.sendRedirect(newLocation);
        }
    }
}
