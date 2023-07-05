package servlet.production;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import assets.*;
import assets.produit.*;
public class StatitiqueProduitEntreeServlet extends HttpServlet{

    protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException,Exception{
        
        PrintWriter out = res.getWriter();
        try{
            
            ProduitFini[] l_p = ProduitFini.getRendement_par_entrepot();
            req.setAttribute("production_par_entrepot",l_p);

            ProduitFini[] l_p_chart = ProduitFini.getRendement_par_entrepot_annee(null);
            req.setAttribute("production_par_entrepot_graphe",l_p_chart);
            req.setAttribute("stat_json_production" , ProduitFini.toJson(l_p_chart));
            StatistiqueFinance stfinance = new StatistiqueFinance(null);
            req.setAttribute("stat_finance", stfinance);
            RequestDispatcher dispat = getServletContext().getRequestDispatcher("/statistique_production_finance.jsp");

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