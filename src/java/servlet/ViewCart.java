/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
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
 * @author INT303
 */
public class ViewCart extends HttpServlet {

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
        HttpSession s = request.getSession(false);
        if (s == null || s.getAttribute("cart") == null || ((Cart) s.getAttribute("cart")).getUnitItem() == 0) {
            request.setAttribute("msg", "Empty Cart ... Please add product to cart !!!");
            getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
        } else {
            //TreeMap<Integer, LineItem> items = request.getParameterValues("productId"); // สินค้าทั้งหมดที่เลือกมา
            Cart cart = (Cart) s.getAttribute("cart");
            Set<Integer> ownerIds = new HashSet<Integer>();

            for (LineItem li : cart.getLineItems()) {
                ownerIds.add(li.getProduct().getAcctID()); // ไหนคือเจ้าของ
            }

            TreeMap<Integer, ArrayList<LineItem>> map = new TreeMap<Integer, ArrayList<LineItem>>();
            for (int o : ownerIds) {
                ArrayList<LineItem> te = new ArrayList<LineItem>();
                // ตรงนี้ก็วนลูป items ทั้งหมด แล้วดึงเฉพาะตัวที้มี ownerId เป็น o (o = ownerId ในรอบปัจจุบันของลูป แล้วสั่ง p.add(productชิ้นนั้น); // ปิดลูป
                for (LineItem li : cart.getLineItems()) {
                    if (li.getProduct().getAcctID() == o) {
                        te.add(li);
                    }

                }

                map.put(o, te);
            }
            request.setAttribute("map", map);
            Map<Integer, Double> price = new TreeMap<Integer, Double>();
            for (int o : map.keySet()) {
                double sum = 0;
                for (LineItem p : map.get(o)) {
                    sum += p.getTotal();
                }
                price.put(o, sum);
            }
            s.setAttribute("price", price);

            getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
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
