/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Accounts;
import model.Product;
import model.ProductPic;
import model.Wishlist;

/**
 *
 * @author Admin
 */
public class ShowDetailServlet extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("productId"));
        int acctid = Integer.parseInt(request.getParameter("acctid"));
        List<Wishlist> wl = Wishlist.showWishlist(acctid);
        List<ProductPic> pp = ProductPic.find(id);
        ProductPic p1 = ProductPic.findf(id);
        Product p = Product.showDetail(id);
        Accounts a = Accounts.findById2(acctid);
        request.setAttribute("showDetail", p);
        request.setAttribute("showName", a);
        List<ProductPic> testo = new ArrayList<ProductPic>();
        for (int i = 0; i < pp.size(); i++){
            if (i >= 1){
               ProductPic test = pp.get(i);
               
               testo.add(test);
            }
        }    
         System.out.println(p);
        request.setAttribute("pic", pp);
        request.setAttribute("picsum", testo);
        request.setAttribute("pic1", p1);
        request.setAttribute("wl", wl);
        System.out.println(pp);
        getServletContext().getRequestDispatcher("/productza.jsp").forward(request, response);
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
