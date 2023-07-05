package servlet.vente;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.ArrayList;

public class ProduitSwitchServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException, Exception {
        PrintWriter out = res.getWriter();
        try {
            String idProduit = req.getParameter("idProduit");
            RequestDispatcher dispat = getServletContext().getRequestDispatcher("/produits.jsp");
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
