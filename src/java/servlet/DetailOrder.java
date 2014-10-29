/*
 * To change this template, choose Tools | Templates
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
public class DetailOrder extends HttpServlet {

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
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        Cart cart = new Cart();
        cart = Cart.getDetailList(orderid);
        request.setAttribute("detail", cart);
        order o = order.searchByID(orderid);
        Accounts a = Accounts.getUser(o.getSeller());
        List<Bank> b = Bank.showBank(a.getAccount_Id());
        Bank bpay = Bank.findBank(o.getBankacct());
        int up = order.updateRead(orderid);
        int up1 = order.updateReadSell(orderid);
        if(o.getPayment()!=null){
            String pm = o.getPaymentHTML();
            request.setAttribute("payment", pm);
        }
        request.setAttribute("order", o);
        request.setAttribute("add", Address.findAddress(o.getAddress()));
        request.setAttribute("total", o.getTotal());
        request.setAttribute("bank", b);
        request.setAttribute("b2", bpay);
        getServletContext().getRequestDispatcher("/OrderDetail.jsp").forward(request, response);

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
