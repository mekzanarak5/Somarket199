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
import model.Accounts;
import model.Address;

/**
 *
 * @author Admin
 */
public class EditAddressServlet extends HttpServlet {

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
        int AcctID = Integer.parseInt(request.getParameter("acctid"));
        int AddID = Integer.parseInt(request.getParameter("addid"));
        String Address = request.getParameter("address");
        String addressthai = new String(Address.getBytes("ISO8859_1"), "UTF-8");
        String Provice = request.getParameter("provice");
        String provicethai = new String(Provice.getBytes("ISO8859_1"), "UTF-8");
        int Post = Integer.parseInt(request.getParameter("post"));
        String Canton = request.getParameter("canton");
        String cantonthai = new String(Canton.getBytes("ISO8859_1"), "UTF-8");
        
        Address c = new Address();
        c.editAddress(addressthai, provicethai, cantonthai, Post, AddID);
        request.setAttribute("edit", c);
        getServletContext().getRequestDispatcher("/ShowAddressServlet?id="+AcctID).forward(request, response);
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
