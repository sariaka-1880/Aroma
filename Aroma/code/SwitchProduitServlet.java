package servlet.vente;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import assets.produit.FicheProduit;
import assets.produit.ProduitFini;
import servlet.vente.*;

public class SwitchProduitServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException, Exception {
        PrintWriter out = res.getWriter();
        try {
            String idProduit = req.getParameter("idProduit");
            int idproduit_Fini = Integer.parseInt(idProduit);

            req.setAttribute("idproduit_Fini",idproduit_Fini);

            RequestDispatcher dispat = getServletContext().getRequestDispatcher("/index.jsp");
            dispat.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        try {
            processRequest(req, res);
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        try {
            processRequest(req, res);
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
}
