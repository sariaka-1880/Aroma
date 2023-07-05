package servlet;
import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDateTime;

import utils.Constantes;
import assets.RechercheTransaction;
import assets.Report;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.MaConnection;
public class AjoutReportServlet extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            Connection connex=MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
            try{
                Report dernier=Report.dernierReport(connex);
                RechercheTransaction recherche=new RechercheTransaction(dernier.getDate(), null, connex);
                LocalDateTime actuel=LocalDateTime.now();
                req.setAttribute("dateactuel", actuel.toLocalDate());
                req.setAttribute("heureactuel", actuel.toLocalTime());
                req.setAttribute("dernier", dernier);
                req.setAttribute("recherche", recherche);
                RequestDispatcher dispat=req.getRequestDispatcher("/ajout_report.jsp");
                dispat.forward(req, resp);
            }finally{
                connex.close();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        LocalDateTime actuel=LocalDateTime.now();
        String valeur=req.getParameter("montant");
        Report report=new Report();
        report.setDate(actuel);
        report.setValeur(valeur);
        try {
            // System.out.println("Report: "+report.getDateString()+", "+report.getValeur()+"Ar");
            report.save(null);
            resp.sendRedirect("/Aroma/ajoutreport");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}