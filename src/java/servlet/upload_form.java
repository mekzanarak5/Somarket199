/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.Part;
import java.io.File;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Admin
 */
public class upload_form extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public String fileSavePath;
    private static final String UPLOAD_DIRECTORY = "Upload";

    public void init() {
        fileSavePath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
        if (!(new File(fileSavePath)).exists()) {
            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        String resp = "";
        int i = 1;
        resp += "<br>Here is information about uploaded files.<br>";
        try {
            MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
            Part _part;
            while ((_part = parser.readNextPart()) != null) {
                if (_part.isFile()) {
                    FilePart fPart = (FilePart) _part;  // get some info about the file
                    String name = fPart.getFileName();
                    if (name != null) {
                        long fileSize = fPart.writeTo(new File(fileSavePath));
                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
                    } else {
                        resp = "<br>The user did not upload a file for this part.";
                    }
                }
            }// end while 
        } catch (java.io.IOException ioe) {
            resp = ioe.getMessage();
        }
        request.setAttribute("message", resp);
        getServletContext().getRequestDispatcher("/upload.jsp").forward(request, response);
    }
}