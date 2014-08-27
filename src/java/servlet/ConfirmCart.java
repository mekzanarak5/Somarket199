/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.LineItem;
import model.Accounts;
import model.Product;
import model.order;

/**
 *
 * @author S๐l2n
 */
public class ConfirmCart extends HttpServlet {

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
        Accounts cus = (Accounts) request.getSession().getAttribute("user");
        if (cus != null) {
            /*Cart c = (Cart) (request.getSession().getAttribute("cart"));
            int order_id = Cart.idGenerator();
            System.out.println(order_id);
            double total = c.getTotal();
            request.setAttribute("orderId", order_id);
            request.setAttribute("cus", cus); */
            /*order.add(o);
            c.addDetail(order_id);
            request.getSession().removeAttribute("cart");
            response.sendRedirect("ShowOrder");*/
            getServletContext().getRequestDispatcher("/MakeSureOrder.jsp").forward(request, response);
            return;
        } else {
            String check = "no";
            request.setAttribute("sas", check);
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
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
