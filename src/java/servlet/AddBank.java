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

/**
 *
 * @author Admin
 */
public class AddBank extends HttpServlet {

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
        String bankname = request.getParameter("bankname");
        String banknamethai = new String(bankname.getBytes("ISO8859_1"), "UTF-8");
        String no = request.getParameter("no");
        String name = request.getParameter("name");
        String namethai = new String(name.getBytes("ISO8859_1"), "UTF-8");
        String msg = "";
        Boolean complete = false;
        model.Bank a = new model.Bank();
        int row =  a.addBank(AcctID, banknamethai,no,namethai);
        if (row == 1) {
            msg = "Congratulations, GoToTheSell!";
            request.setAttribute("msg", msg);
            complete = true;

        } else {
            msg = "Database is not updated, please contact administrator.";
            request.setAttribute("msg", msg);
            complete = false;
        }

        if (complete) {
            request.setAttribute("lastid", a.lastid());
            getServletContext().getRequestDispatcher("/ShowBankServlet?id="+AcctID).forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/bankacc.jsp").forward(request, response);
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
