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

/**
 *
 * @author Admin
 */
public class SendPmServlet extends HttpServlet {

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
        if (a== null){
            request.setAttribute("msg", "Go To Login !");
        }
        
        else{
            String pm = request.getParameter("pm");
            String pmthai = new String(pm.getBytes("ISO8859_1"),"UTF-8");
            String pm1 = "<br>"+pm+"<br>";
            String pm1thai = new String(pm1.getBytes("ISO8859_1"),"UTF-8");
            String subject = request.getParameter("subject");
            String subthai = new String(subject.getBytes("ISO8859_1"),"UTF-8");
            int receiverID  = Integer.parseInt(request.getParameter("receiverID"));
            String time = request.getParameter("time");
            int senderID = a.getAccount_Id();
            String senderName = request.getParameter("senderName");
            String receiverName = request.getParameter("receiverName");
            Message c = new Message();
            c.insertPM(subthai,senderID, receiverID,senderName,receiverName, pm1thai,time);
            request.setAttribute("pm", c);
            request.setAttribute("u", senderID);
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
