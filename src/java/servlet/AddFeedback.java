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
import model.Feedback;
import model.order;

/**
 *
 * @author Mekza
 */
public class AddFeedback extends HttpServlet {

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
        int orderid = Integer.parseInt(request.getParameter("id"));
        order o  = order.searchByID(orderid);
        Accounts acct= (Accounts) request.getSession().getAttribute("user");
        String comm = request.getParameter("comment");
        int rates = Integer.parseInt(request.getParameter("rating"));
        Feedback f = new Feedback();
        String msg = "Sorry: place feedback failed";
        int check = 0;
        /*String url = request.getParameter("url");
        String url2 = url.substring(0, 33);*/
        if (acct.getUsername().equals(o.getUsername())){
            f.setAcct(o.getSeller());
            f.setFrom(o.getUsername());
            f.setOrder(orderid);
            f.setComment(comm);
            f.setType("Seller");
            f.setRate(rates);
            check += f.add(f);
            if(check > 0)
                msg = "Thank you for feedback to\t" +o.getSeller()+".";
        }else{
            f.setAcct(o.getUsername());
            f.setFrom(o.getSeller());
            f.setOrder(orderid);
            f.setComment(comm);
            f.setType("Buyer");
            f.setRate(rates);
            check += f.add(f);
            if(check > 0)
                msg = "Thank you for feedback to\t" +o.getUsername()+".";
            
        }
        System.out.println(check);
        request.setAttribute("feba", f);
        System.out.println(f);
        request.setAttribute("msg", msg);
        
        getServletContext().getRequestDispatcher("/ViewFeedback?facct="+f.getAcct()).forward(request, response); /*+ "&show=modal"*/
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
