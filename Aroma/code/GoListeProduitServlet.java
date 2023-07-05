package servlet.vente;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class GoListeProduitServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException, Exception {
        PrintWriter out = res.getWriter();
        try {

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
