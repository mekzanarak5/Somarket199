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
import javax.servlet.http.HttpSession;
import model.Cart;
import model.LineItem;
import model.Accounts;
import model.Product;

/**
 *
 * @author INT303
 */
public class AddToCart extends HttpServlet {

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
        String products="";
        /*HttpSession ss = request.getSession();
        Member m = (Member)ss.getAttribute("user");
        if ( m == null) {
            request.setAttribute("msg", "Please Sign-In before add product !");
        } else {*/
            products = request.getParameter("productId");
            String url = request.getParameter("url");
            HttpSession s = request.getSession(true);
            if (s.getAttribute("cart") == null) {
                s.setAttribute("cart", new Cart());
            }
            Cart cart = (Cart) s.getAttribute("cart");
            Product tmp = null;
            LineItem li = null;
            //for(String pidStr : products){
            tmp = Product.findById(Integer.parseInt(products));
            li = new LineItem(tmp);
            cart.add(li);
            //}
        request.setAttribute("msg","Add " + tmp.getName() + " Complete");
        //String key = request.getParameter("keySearch");
        String key = request.getParameter("productId");
        response.sendRedirect(url);
        //getServletContext().getRequestDispatcher(url)/*("/ShowDetailServlet?productId="+key)*/.forward(request, response);

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
