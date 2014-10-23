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
import model.Accounts;
import model.Address;
import model.Bank;
import model.Cart;
import model.order;

/**
 *
 * @author S๐l2n
 */
public class OrderFinish extends HttpServlet {

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
        String ems = request.getParameter("ems");
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        order o = order.searchByID(orderid);
        Cart cart = Cart.getDetailList(orderid);
        Accounts seller = Accounts.getUser(o.getSeller());
        Bank bpay = Bank.findBank(o.getBankacct());
        if(Integer.parseInt(ems) == 0){
            order.update("status", "rejected");
            List<Bank> b = Bank.showBank(seller.getAccount_Id());
            request.setAttribute("bank", b);
        }else{
            order.addEms(orderid, "shipping", ems);
            request.setAttribute("add", Address.findAddress(o.getAddress()));
            request.setAttribute("b2", bpay);
            //System.out.println("mother fucker");
        }
        request.setAttribute("detail", cart);
        request.setAttribute("order", o);
        getServletContext().getRequestDispatcher("/OrderDetail.jsp").forward(request, response);
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
