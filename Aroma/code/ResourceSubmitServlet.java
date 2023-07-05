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

import java.util.ArrayList;

public class ResourceSubmitServlet  extends HttpServlet{

    protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException,Exception{
        PrintWriter out = res.getWriter();
        try{
        
            Integer idRessource=Integer.parseInt(req.getParameter("ressource"));
                if (req.getParameter("ressource") == null || req.getParameter("ressource").isEmpty() ) {  
                    throw new Exception("La valeur de ressource est manquante ou vide");

                }

            Integer idFournisseur=Integer.parseInt(req.getParameter("fournisseur"));
                if (req.getParameter("fournisseur") == null || req.getParameter("fournisseur").isEmpty()) {
                    throw new Exception("La valeur de fournisseur est manquante ou vide");
                }

            double quantite=Double.parseDouble(req.getParameter("quantiter"));
                if (quantite == 0.0  ) {
                    throw new Exception("La valeur de quantite est manquante ou vide");
                }

            String date=req.getParameter("dateajout");
                if (date == null || date.isEmpty()) {
                    throw new Exception("La valeur de date d'ajout est manquante ou vide");      
                }

            LocalDate dateAjout = LocalDate.parse(date);
            String date_Peremption=req.getParameter("dateperemption");
                if (date_Peremption == null ) {
                    throw new Exception("La valeur de date de peremption est manquante ou vide");
                }
            int compareDate= date.compareTo(date_Peremption);
                if(compareDate > 0){
                    throw new Exception("La valeur de date de prememption doit etre superieur a date d'ajout est manquante ou vide");
                }

            LocalDate datePeremption = LocalDate.parse(date_Peremption);
            double prixUnitaire=Double.parseDouble(req.getParameter("prixUnitaire"));
                if (prixUnitaire ==0.0 ) {
                    throw new Exception("La valeur de date de peremption est manquante ou vide");
                }

            Ressource ressource=new Ressource();
            ressource.setId(idRessource);
            Fournisseur fournisseur=new Fournisseur();
            fournisseur.setId(idFournisseur);

            AjoutRessource ajoutRessource=new AjoutRessource(ressource, dateAjout, quantite, prixUnitaire ,datePeremption ,fournisseur);
            boolean verif =ajoutRessource.insert(null);

            if(verif==true){
                res.sendRedirect("/Aroma/ressource");
            }else{
                out.println("tsy mety");
            }   

        }catch(Exception e ){

            req.setAttribute("error", e.getMessage());
            RequestDispatcher dispat = req.getRequestDispatcher("/ressource");
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