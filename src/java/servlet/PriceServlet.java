/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author Admin
 */
public class PriceServlet extends HttpServlet {

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
        
        String sid = request.getParameter("id");
        String cat = request.getParameter("herolist");
        double str = Double.parseDouble(request.getParameter("price1"));
        double st = Double.parseDouble(request.getParameter("price2"));
        String xx = request.getParameter("x");
        int x = xx.length() == 0 ? 0 : Integer.parseInt(xx);
        int y = Integer.parseInt(request.getParameter("y"));
        int totalPage = (int) Math.ceil((Product.countRowp(sid,str,st) * 1.0) / y);
        request.setAttribute("totalPage", totalPage);   
        request.setAttribute("products", Product.findPrice(sid, cat, x, y, str, st));
        request.setAttribute("currentPage", (int) Math.ceil(x / y) + 1);
        HttpSession s1 = request.getSession();
        HttpSession s2 = request.getSession();
        HttpSession s3 = request.getSession();
        HttpSession s4 = request.getSession();
        s1.setAttribute("pro", sid);
        s2.setAttribute("cat", cat);
        s3.setAttribute("x", x);
        s4.setAttribute("y", y);
        
        getServletContext().getRequestDispatcher("/search.jsp").forward(request, response);
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
