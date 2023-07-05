package servlet.culutre;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.Vector;

import assets.Activite;
public class PlanningEntreeServlet  extends HttpServlet{

    protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException,Exception{
        PrintWriter out = res.getWriter();
        try{
            Vector<Activite> listActivite = Activite.getAllActivite();
            String String_listActivite = Activite.ArrayToString(listActivite);
            req.setAttribute("listActivite",String_listActivite);
            RequestDispatcher dispat = getServletContext().getRequestDispatcher("/planning.jsp");

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