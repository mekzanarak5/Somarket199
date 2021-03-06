/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String AcctID = request.getParameter("acctid");
        String Name = request.getParameter("name");
        String namethai = new String(Name.getBytes("ISO8859_1"), "UTF-8");
        String Description = request.getParameter("des");
        String desthai = new String(Description.getBytes("ISO8859_1"), "UTF-8");
        String Available = request.getParameter("available");
        int Category_ID = Integer.parseInt(request.getParameter("cata"));
        String CreateOn = request.getParameter("create");
        Double Price = Double.parseDouble(request.getParameter("price"));
        String Brand = request.getParameter("brand");
        

//        double price = Double.parseDouble(request.getParameter("price"));
        String pic = "";
        String msg = "";
        Boolean complete = false;

        model.Product p = new model.Product();

        int row =  p.addProducts(AcctID, Category_ID, namethai, Price, CreateOn,desthai,Available,Brand);
        if (row == 1) {
            msg = "Congratulations, GoToTheSell!";
            request.setAttribute("msg", msg);
            complete = true;

        } else {
            msg = "Database is not updated, please contact administrator.";
            request.setAttribute("msg", msg);
            complete = false;
        }

        if (complete) {
            request.setAttribute("lastid", p.lastid());
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/post.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
