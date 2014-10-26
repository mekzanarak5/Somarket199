/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductPic;
import model.Test;
import model.order;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Admin
 */
public class Pay2 extends HttpServlet {

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
        File file;
//        MultipartRequest m = new MultipartRequest(request, "/Users/Mekza/Documents/NetBeansProjects/Somarket199/web/pic/upload/");
        MultipartRequest m = new MultipartRequest(request, "/Users/Admin/NetBeansProjects/Somarket-8da7c71cd5a93990ea83ebd3f555e2452c1aa271/Somarket-8da7c71cd5a93990ea83ebd3f555e2452c1aa271/web/pic/upload/");
        String date = m.getParameter("paydate");
        String time = m.getParameter("paytime");
        String pic = m.getFilesystemName("pic");
        double amount = Double.parseDouble(m.getParameter("payamount"));
        String refid = "";
        int bank = Integer.parseInt(m.getParameter("bankid"));
        int addr = Integer.parseInt(m.getParameter("shipaddr"));
        String pic1 = "";
        int orderid = Integer.parseInt(m.getParameter("id"));
//        String namethai = new String(name.getBytes("ISO8859_1"), "UTF-8");
//        String desthai = new String(des.getBytes("ISO8859_1"), "UTF-8");
        String acctid = "";
        String msg = "";
        String sum = date + "\n" + time + "\n" + amount + "\n" + refid;
        order.addBank(orderid, bank);
        order.addPayment(orderid, sum);
//        order.addSlip(orderid, "/Users/Mekza/Documents/NetBeansProjects/Somarket199/web/pic/upload/"+pic);
        order.addSlip(orderid, "/Users/Admin/NetBeansProjects/Somarket-8da7c71cd5a93990ea83ebd3f555e2452c1aa271/Somarket-8da7c71cd5a93990ea83ebd3f555e2452c1aa271/web/pic/upload/"+pic);
        order.addAddr(orderid, addr);
        //order.addPayment(orderid, );

        getServletContext().getRequestDispatcher("/DetailOrder?orderid="+orderid).forward(request, response);
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
