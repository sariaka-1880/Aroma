package servlet.vente;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.util.ArrayList;
import servlet.vente.Client;

public class LienFactureEntreeServlet  extends HttpServlet{

    protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException,Exception{
        PrintWriter out = res.getWriter();
        try{
            String nom_client = req.getParameter("nom_client");
            String numero = req.getParameter("numero_phone");
            String adresse = req.getParameter("adresse");
            Connection co;
            Client c = new Client();
            c.insertClient(null, nom_client, numero, adresse);
            out.println("miditra");
            RequestDispatcher dispat = getServletContext().getRequestDispatcher("/index.jsp");
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