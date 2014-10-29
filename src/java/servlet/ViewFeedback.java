/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Accounts;
import model.Feedback;

/**
 *
 * @author S๐l2n
 */
public class ViewFeedback extends HttpServlet {

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
        Accounts acct = (Accounts) request.getSession().getAttribute("user");
        Accounts acc = Accounts.findById(request.getParameter("facct"));
        request.setAttribute("showName", acc);
        /*String url = request.getParameter("url");
        String url2 = url.substring(0, 33);*/
        
        if (request.getParameter("orderid")==null){
            List<Feedback> ma = new ArrayList<Feedback>();
            String fuser;
            String url;
            if (request.getParameter("facct") == null){
                fuser = acct.getUsername();
                url = "/feedback.jsp";
            }else{
                fuser = request.getParameter("facct");
                url = "/feedback_1.jsp";
            
        }
            ma = Feedback.getFeedList(fuser);
            request.setAttribute("flist", ma);
            getServletContext().getRequestDispatcher(url).forward(request, response);
        }else{
            int oid = Integer.parseInt(request.getParameter("orderid"));
            Feedback fd = Feedback.checkSender(oid, acct.getUsername());
            request.setAttribute("feedo", fd);
            
            getServletContext().getRequestDispatcher("/feedback.jsp").forward(request, response);
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
