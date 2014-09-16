/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Accounts;
import model.Cart;
import model.LineItem;
import model.Product;
import model.order;

/**
 *
 * @author S๐l2n
 */
public class ConfirmCart extends HttpServlet {

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
        Accounts cus = (Accounts) request.getSession().getAttribute("user");
       // TreeMap<Integer, ArrayList<Product>> map = (TreeMap) request.getAttribute("map");
        Map<Integer, Double> price = (TreeMap) request.getSession().getAttribute("price");
        //String address = request.getParameter("address");
        int value = 0;
        if (cus != null) {
            //Set<Map.Entry<Integer, ArrayList<Product>>> entrySeto = map.entrySet();
            Set<Map.Entry<Integer, Double>> entrySetp = price.entrySet();
            Cart c = (Cart) (request.getSession().getAttribute("cart"));
            /* int order_id = Cart.idGenerator();
             System.out.println(order_id);
             double total = c.getTotal();
             request.setAttribute("orderId", order_id);
             request.setAttribute("cus", cus); */
            /*order.add(o);
             c.addDetail(order_id);
             request.getSession().removeAttribute("cart");
             response.sendRedirect("ShowOrder");*/
            for (Map.Entry<Integer, Double> entry : entrySetp){
                order o = new order();
                int order_id = Cart.idGenerator();
                System.out.println(order_id);
                o.setOrderId(order_id);
                o.setAcctno(cus.getAccount_Id());
                o.setTotal(entry.getValue());
                System.out.println(o);
                value += o.add(o);
                c.setOrderId(order_id);
                c.addDetail(entry.getKey());
            }
            //order o = new order();
            //Cart c = (Cart) (request.getSession().getAttribute("cart"));
            //int order_id = Cart.idGenerator();
            //System.out.println(order_id);
            //double total = c.getTotal();
            //double total = (Double) request.getAttribute("price");
            //o.setAddress(address);
            
            //order.add(o);
            //c.addDetail(order_id);
            /*if (!address.equals("null")) {
             value = o.add(o);
             c.addDetail(o.getOrderId());
             }*/
            if (value > 0) {
                request.setAttribute("msg", "Confirm Order Complete Please do your payment with in 3 days");
                //request.getSession().removeAttribute("cart");
                //response.sendRedirect("ShowOrder");
                getServletContext().getRequestDispatcher("/MakeSureOrder.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("msg", "Confirm Order Failed Please Chose Address");
                getServletContext().getRequestDispatcher("/ViewCart").forward(request, response);
            }

            /*getServletContext().getRequestDispatcher("/MakeSureOrder.jsp").forward(request, response);
            return;*/
        } else {
            String check = "no";
            request.setAttribute("sas", check);
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
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
