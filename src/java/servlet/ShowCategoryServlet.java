/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Address;
import model.Category;
import model.Message;
import model.Product;

/**
 *
 * @author Mekza
 */
public class ShowCategoryServlet extends HttpServlet {

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
        HttpSession s1 = request.getSession();
        HttpSession s2 = request.getSession();
        HttpSession s3 = request.getSession();
        HttpSession s4 = request.getSession();
        Map<Category, List<Category>> cate = new HashMap<Category, List<Category>>();

        for (Category category : Category.findBigAll()) {
            List<Category> subCategories = Category.findBigP(category.getCateID());
            cate.put(category, subCategories);
            System.out.println(subCategories);
        }
        s1.setAttribute("cate", cate);
        List<Product> a = Product.showRandomProductCom();
        s2.setAttribute("pro1", a);
        List<Product> a1 = Product.showRandomProductMob();
        s3.setAttribute("pro2", a1);
        List<Product> a2 = Product.showRandomProductCam();
        s4.setAttribute("pro3", a2);
        
        System.out.println();
        response.sendRedirect("index1.jsp");
//        HttpSession s1 = request.getSession();
//        List<Category> c = Category.findBigAll();
//        s1.setAttribute("cateID", c);
//        HttpSession s2 = request.getSession();
//        List<Category> cc = Category.findBigP();
//        int currentId=0;
//        
//        List<Category> c2 = new ArrayList<Category>();
//        List<Category> c3 = new ArrayList<Category>();
//        for (Category category : cc) {
//            currentId = category.getCateID();   
//            c2 = Category.findByParent(currentId);
//            System.out.println(currentId);
//            c3.addAll(c2);
//        }
//        s2.setAttribute("cateID1", c3);
//        response.sendRedirect("home.jsp");

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
