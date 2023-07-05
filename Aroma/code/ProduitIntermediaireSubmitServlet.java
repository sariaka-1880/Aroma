
package servlet.culutre;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Date;
import java.util.ArrayList;
import java.time.LocalDate;

import assets.Ressource;
import assets.Stock;
import assets.UtilisationRessource;
import assets.Fournisseur;
import assets.Plantation;
import assets.ProduitIntermediaire;
import assets.RecetteProduitIntermediaire;

import java.util.HashMap;

public class ProduitIntermediaireSubmitServlet extends HttpServlet{
  
  protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException,Exception{
    PrintWriter out = res.getWriter();
    try{

        Integer idproduitIntermediaire=Integer.parseInt(req.getParameter("produitIntermediaire"));
            if (req.getParameter("produitIntermediaire") == null || req.getParameter("produitIntermediaire").isEmpty() ) {    
                throw new Exception("La valeur de produitIntermediaire est manquante ou vide.");
            }

        String date=req.getParameter("date");
        LocalDate dateverif = LocalDate.parse(date);
        Date dateutilisation=Date.valueOf(date);
            if (req.getParameter("date") == null || req.getParameter("date").isEmpty() ) {    
                throw new Exception("La valeur de date est manquante ou vide.");
            }

        Double quantite=Double.parseDouble(req.getParameter("quantiter"));
            if (quantite == 0.0 ) {
                throw new Exception("La valeur de la quantite est manquante ou vide.");
            }

        ProduitIntermediaire produitIntermediaire=new ProduitIntermediaire();
        produitIntermediaire.setId(idproduitIntermediaire);
        boolean verif =produitIntermediaire.setRecettebo(null);
        out.println(verif);
      
        if(verif==true){
            RecetteProduitIntermediaire recetteProduitIntermediaire=new RecetteProduitIntermediaire();
            recetteProduitIntermediaire=produitIntermediaire.getRecette();
        
            for (Ressource ressource : recetteProduitIntermediaire.getRecette().keySet()) {
                Double quantiteilaina =recetteProduitIntermediaire.getRecette().get(ressource);
                out.println("Ressource : " + ressource.getId() + ", Quantité : " + quantiteilaina);

                Plantation plantation=new Plantation();
                plantation.setProduit(produitIntermediaire);
                plantation.setDate(dateverif);
                plantation.setQuantite(quantite);

                boolean verifstock =plantation.verifierStock(null);
                out.println("verif stock"+verifstock);
            
            if(verifstock==true){

                UtilisationRessource utilisationRessource=new UtilisationRessource();
                utilisationRessource.setUtilisationByPlantation(plantation);
                out.print("tsy aiko "+utilisationRessource.getUtilisation().get(ressource));
                boolean verifrahatenamety=utilisationRessource.insert(null);
                out.println(verifrahatenamety);
                res.sendRedirect("/Aroma/produitintermediaire");

            }else{

                throw new Exception("ressource manquante"); 
            }
        }    
     }   

    }catch( Exception e ){

        req.setAttribute("error", e.getMessage());
        RequestDispatcher dispat = req.getRequestDispatcher("/produitintermediaire");
        dispat.forward(req, res);

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

