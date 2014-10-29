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
import model.Address;
import model.Bank;

/**
 *
 * @author Mekza
 */
public class LoginServlet extends HttpServlet {

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
        /*HttpSession s = request.getSession();
         String username = request.getParameter("username");
         String password = request.getParameter("password");
         String msg = "";

         if (username != null && password != null) {
         Accounts a = Accounts.findById(username);
         if (a != null && a.getPassword().equals(password)) {
         s = request.getSession();
         s.setAttribute("user", a);
         request.setAttribute("msg", msg);
         getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
         } else {
         msg = "Invalid User ID or Password";
         }
         }

         request.setAttribute("msg", msg);
         getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response); */
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String msg = null;
        Accounts m1 = new Accounts();
        //Admin a1 = new Admin();

        // if(from.equalsIgnoreCase("/viewCart.jsp")){
        // }

        /*if (a1.login(username, password)) {
         HttpSession s1 = request.getSession();
         s1.setAttribute("username", username);
         s1.setAttribute("admin", a1.findByUsername(username));
         //            request.setAttribute("username", username);
         getServletContext().getRequestDispatcher("/AdminView.jsp").forward(request, response);
         return;
         } else { */
        if (m1.login(username, password)) {
            HttpSession s1 = request.getSession();
            s1.setAttribute("username", username);
            s1.setAttribute("user", m1.findById(username));
            request.setAttribute("username", username);
        } else {
            msg = "Login Failed";
            request.setAttribute("msg", msg);
            getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
            return;
        }

        if (request.getParameter("url") != null) {
            getServletContext().getRequestDispatcher("/MakeSureOrder.jsp").forward(request, response);
            return;
        }
        Accounts acc = (Accounts) request.getSession().getAttribute("user");
        int acct = acc.getAccount_Id();
        if (Address.checkAddr(acct) & Bank.checkBank(acct)) {
            request.setAttribute("msg2", "boss");
        } else {
            msg = "Please complete your account information (add your Address/Bank Accounts)";
            HttpSession s2 = request.getSession();
            s2.setAttribute("msg1", msg);
        }
        getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
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
