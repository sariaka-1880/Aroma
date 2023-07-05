package servlet.culutre;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Date;
import java.time.LocalDate;

import assets.AjoutRessource;
import assets.Fournisseur;
import assets.Ressource;
import assets.Produit;
import assets.ProduitIntermediaire;

import java.util.ArrayList;
import assets.Ressource;
import assets.Fournisseur;
import assets.Recolte;

public class RecolteSubmitServlet  extends HttpServlet{

    protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException,Exception{
        PrintWriter out = res.getWriter();
        
      try {
        
        int idproduitIntermediaire=Integer.parseInt(req.getParameter("produitIntermediaire"));
        ProduitIntermediaire produitIntermediaire=new ProduitIntermediaire();
        produitIntermediaire.setId(idproduitIntermediaire);
        String date=req.getParameter("date");
        LocalDate dateverif = LocalDate.parse(date);
        Date dateutilisation=Date.valueOf(date);
        int quantite=Integer.parseInt(req.getParameter("quantiter"));
        Recolte recolte=new Recolte(produitIntermediaire, dateutilisation, quantite);
        out.println("aonaaa??");
        out.println("idProduitIntermediaire: "+idproduitIntermediaire);
        out.println("idProduit recolte: "+recolte.getProduit_intermediaire().getId());
        recolte.insert(null);
        out.println("eto ve mety ????");
        res.sendRedirect("/Aroma/recolte");

      } catch (Exception e) {
        // TODO: handle exception
        e.printStackTrace();
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
