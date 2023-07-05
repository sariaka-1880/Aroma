package servlet.culutre;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.ArrayList;
import java.util.Vector;

import assets.ProduitIntermediaire;
import assets.TypeActivite;
public class InsertionEventEntreeServlet  extends HttpServlet{

    protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException,Exception{
        PrintWriter out = res.getWriter();
        try{
            
            ArrayList<ProduitIntermediaire> listProduit = ProduitIntermediaire.getAllProduitIntermediaires(null);
            Vector<TypeActivite> listTypeActivite =  TypeActivite.getAllTypeActivite();
            req.setAttribute("listProduit",listProduit);
            req.setAttribute("listTypeActivite",listTypeActivite); 

            RequestDispatcher dispat = getServletContext().getRequestDispatcher("/insertion_evenement.jsp");

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