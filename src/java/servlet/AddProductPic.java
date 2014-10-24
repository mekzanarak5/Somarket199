/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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
import model.Accounts;
import model.Address;
import model.Bank;
import model.ProductPic;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Admin
 */
public class AddProductPic extends HttpServlet {

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
        Accounts acc = (Accounts) request.getSession().getAttribute("user");
        int acct = acc.getAccount_Id();
        if (Address.checkAddr(acct) & Bank.checkBank(acct)) {
            File file;
            String name = "";
            double price = 0;
            String des = "";
            String available = "";
            int cata = 0;
            String CreateOn = "";
            String brand = "";
            String pic = "";
            String id = "";
//        String namethai = new String(name.getBytes("ISO8859_1"), "UTF-8");
//        String desthai = new String(des.getBytes("ISO8859_1"), "UTF-8");
            String acctid = "";
            String msg = "";
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            ServletContext context = request.getServletContext();
            String filePath = context.getInitParameter("file-upload");

            // Verify the content type  
            List<String> st = new ArrayList<>();
            List<String> st1 = new ArrayList<>();
            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);
                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("c:\\temp"));

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);
                // maximum file size to be uploaded.
                upload.setSizeMax(maxFileSize);

                try {
                    // Parse the request to get file items.
                    List fileItems = upload.parseRequest(request);

                    // Process the uploaded file items
                    Iterator i = fileItems.iterator();

                    while (i.hasNext()) {
                        FileItem fi = (FileItem) i.next();
                        if (!fi.isFormField()) {
                            System.out.println(fi);
                            if (fi.getSize()==0) {
                                st1.add("pic/upload/" + "no_image.png");
                            } else {

                                // Get the uploaded file parameters
                                String fieldName = fi.getFieldName();
                                String fileName = fi.getName();
                                boolean isInMemory = fi.isInMemory();
                                long sizeInBytes = fi.getSize();
                                // Write the file
                                if (fileName.lastIndexOf("\\") >= 0) {
                                    file = new File(filePath
                                            + fileName.substring(fileName.lastIndexOf("\\")));
                                } else {
                                    file = new File(filePath
                                            + fileName.substring(fileName.lastIndexOf("\\") + 1));
                                }
                                fi.write(file);
                                st1.add("pic/upload/" + fileName);
                            }
                        } else if (fi.isFormField()) {
                            st.add(fi.getString());
                        }
                    }
                } catch (Exception ex) {
                    System.out.println(ex);
                }
            } else {
            }
            System.out.println(st);
            for (int i = 0; i < st.size(); i++) {
                if (i == 0) {
                    name = st.get(0);
                } else {
                }
                if (i == 1) {
                    price = Double.parseDouble(st.get(1));
                } else {
                }
                if (i == 2) {
                    des = st.get(2);
                } else {
                }
                if (i == 3) {
                    available = st.get(3);
                } else {
                }
                if (i == 4) {
                    cata = Integer.parseInt(st.get(4));
                } else {
                }
                if (i == 5) {
                    brand = st.get(5);
                } else {
                }
                if (i == 6) {
                    acctid = st.get(6);
                }
            }
            Boolean complete = false;
            model.Product p = new model.Product();
            String namethai = new String(name.getBytes("ISO8859_1"), "UTF-8");
            String desthai = new String(des.getBytes("ISO8859_1"), "UTF-8");
            int row = 0;
            if (brand == null) {
                brand = null;
                row = p.addProducts(acctid, cata, namethai, price, CreateOn, desthai, available, brand);
            } else {
                row = p.addProducts(acctid, cata, namethai, price, CreateOn, desthai, available, brand);
            }
            for (int i = 0; i < st1.size() - (st1.size() - 1); i++) {
                ProductPic a = new ProductPic();
                a.insertPic(st1);
            }

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
                request.setAttribute("lastid", p.lastid());
                getServletContext().getRequestDispatcher("/ShowSellServlet?id=" + acctid).forward(request, response);
            } else {
                getServletContext().getRequestDispatcher("/postandpic1.jsp").forward(request, response);
            }
        } else {
            String msg = "Please complete your account information (Add your address/ bank account)";
            request.setAttribute("msg", msg);
            getServletContext().getRequestDispatcher("/ShowAddressServlet?id=" + acct).forward(request, response);
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
