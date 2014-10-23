/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
/**
 *
 * @author Admin
 */
public class AddCategory extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String cateName = request.getParameter("cateName");
       String catethai = new String(cateName.getBytes("ISO8859_1"), "UTF-8");
       String parentid = request.getParameter("parentid");
       String value = request.getParameter("value");
       String msg = "";
        Boolean complete = false;
       model.Category a = new model.Category();

        int row =  a.addCatBig(catethai, parentid, value);
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
            request.setAttribute("lastid", a.lastid());
            getServletContext().getRequestDispatcher("/AdminShowReport").forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
