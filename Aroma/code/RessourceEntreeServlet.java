package servlet.culutre;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.ArrayList;
import assets.Ressource;
import assets.Fournisseur;


public class RessourceEntreeServlet  extends HttpServlet{

    protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException,Exception{
        PrintWriter out = res.getWriter();
        try{

            ArrayList<Ressource> ressources=Ressource.getAllRessources(null);
            ArrayList<Fournisseur> fournisseurs=Fournisseur.getAllFournisseurs(null);

            req.setAttribute("ressources", ressources);
            req.setAttribute("fournisseurs", fournisseurs);
        
            RequestDispatcher dispat = getServletContext().getRequestDispatcher("/utilisation.jsp");
            dispat.forward(req,res);

        }catch( Exception e ){
            e.printStackTrace();
            throw e;
        } 
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
        PrintWriter out = res.getWriter();
        try{
            processRequest(req, res);
        }catch( Exception e ){
            out.println(e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
        PrintWriter out = res.getWriter();
        try{
            processRequest(req, res);
        }catch( Exception e ){
            out.println(e.getMessage());
        }
    }
}