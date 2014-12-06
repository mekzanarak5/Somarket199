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
import javax.servlet.http.HttpSession;
import model.Cart;
import model.LineItem;
import model.Product;
import model.order;

/**
 *
 * @author S๐l2n
 */
public class UpdateOrder extends HttpServlet {

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
        String[] oid = request.getParameterValues("oId");
        String upd = request.getParameter("updates");
        String url = request.getParameter("url");
        if (upd.equalsIgnoreCase("Paid")){
            for (int i = 0; i < oid.length; i++){
                order.upStat(Integer.parseInt(oid[i]), "Paid");
            }
        }else {
            for (int i = 0; i < oid.length; i++){
                order.upStat(Integer.parseInt(oid[i]), "invalid");
                order.update("Comment", "The payment is wrong, please complete it again.");
            }
        }/*if(pid.length==unit.length){
           for (int i = 0; i < pid.length; i++) {
               p = p.findById(Integer.parseInt(pid[i]));
            li =new LineItem(p);
            li.setUnit(Integer.parseInt(unit[i]));
            cart.add(li);
           }
       }*/
        //s.setAttribute("cart", cart);
       //getServletContext().getRequestDispatcher("/ViewCart").forward(request, response);
        response.sendRedirect(url);
        
        
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
