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
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class SearchProductServlet extends HttpServlet {

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
        String xx = request.getParameter("x");
        int x = xx.length() == 0 ? 0 : Integer.parseInt(xx);
        int y = Integer.parseInt(request.getParameter("y"));
        int totalPage = (int) Math.ceil((Product.countRow(sid) * 1.0) / y);
        request.setAttribute("x", x);
        request.setAttribute("y", y);
        request.setAttribute("id", sid);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("products", Product.page(sid,cat, x, y));
        request.setAttribute("currentPage", (int) Math.ceil(x / y) + 1);
        String url = request.getParameter("url");                        
        HttpSession s1 = request.getSession();
        HttpSession s2 = request.getSession();
        List<Product> cs = Product.search(sid, cat);
        s1.setAttribute("pro", sid);
        s2.setAttribute("cat", cat);
        request.setAttribute("cs", cs);
        if (cs.size() == 0) {
            request.setAttribute("msg", "Seller/Price/Product: " + sid + " does not exist !!!");
        }
        request.setAttribute("productNO", cs);
        System.out.println(s1.getAttribute("pro"));

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
