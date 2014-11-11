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
import model.Accounts;
import model.Message;
import model.Product;

/**
 *
 * @author Admin
 */
public class SendReport extends HttpServlet {

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
        Accounts a = (Accounts) s.getAttribute("user");
        if (a == null) {
            getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
            request.setAttribute("msg", "Go To Login !");
        } else {
            String pm = request.getParameter("herolist");
            String pmthai = new String(pm.getBytes("ISO8859_1"), "UTF-8");
            String subject = request.getParameter("subject");
            String subthai = new String(subject.getBytes("ISO8859_1"), "UTF-8");
            int receiver = Integer.parseInt(request.getParameter("receiver"));
            int sender = a.getAccount_Id();
            String senderName = request.getParameter("senderName");
            String receiverName = request.getParameter("receiverName");
            Message c = new Message();
            c.insertPM(subthai, sender, receiver,senderName,receiverName, pmthai);
            request.setAttribute("pm", c);
            request.setAttribute("u", sender);
        }
        int proid = Integer.parseInt(request.getParameter("proid"));
        String accid = request.getParameter("accid");
        Product p = Product.showDetail(proid);
        request.setAttribute("pro", p);
        getServletContext().getRequestDispatcher("/ShowDetailServlet?productId=" + proid + "&acctid=" + accid).forward(request, response);

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
