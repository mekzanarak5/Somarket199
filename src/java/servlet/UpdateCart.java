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
import model.Product;

/**
 *
 * @author S๐l2n
 */
public class UpdateCart extends HttpServlet {

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
        String[] pid = request.getParameterValues("productId");
        String[] unit = request.getParameterValues("unit");
        HttpSession s = request.getSession(true);
        if (s.getAttribute("cart") == null) {
            s.setAttribute("cart", new Cart());
        }else{
            s.removeAttribute("cart");
        }
        Cart cart = new Cart();
        Product p = null;
        LineItem li = null ;
        if(pid.length==unit.length){
           for (int i = 0; i < pid.length; i++) {
               p = p.findById(Integer.parseInt(pid[i]));
            li =new LineItem(p);
            li.setUnit(Integer.parseInt(unit[i]));
            cart.add(li);
           }
       }
        s.setAttribute("cart", cart);
        getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
        
        
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
