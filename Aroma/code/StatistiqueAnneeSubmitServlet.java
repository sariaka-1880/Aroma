package servlet.culutre;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

import assets.Produit;
import assets.StatistiqueCulture;
public class StatistiqueAnneeSubmitServlet  extends HttpServlet{

    protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException,Exception{
        PrintWriter out = res.getWriter();
        try{
            StatistiqueCulture statYlangPlante = new StatistiqueCulture(Produit.getProduitById(1, null));
            StatistiqueCulture statYlangRecolte = new StatistiqueCulture(Produit.getProduitById(2, null));
            StatistiqueCulture statGeraniumPlante = new StatistiqueCulture(Produit.getProduitById(3, null));
            StatistiqueCulture statGeraniumRecolte = new StatistiqueCulture(Produit.getProduitById(4, null));
            req.setAttribute("statYlangPlante",statYlangPlante);
            req.setAttribute("statYlangRecolte",statYlangRecolte);
            req.setAttribute("statGeraniumPlante",statGeraniumPlante);
            req.setAttribute("statGeraniumRecolte",statGeraniumRecolte);
            RequestDispatcher dispat = getServletContext().getRequestDispatcher("/statistique.jsp");

            System.out.print("huhu");

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