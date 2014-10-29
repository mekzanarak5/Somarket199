/*
 * To change this template, choose Tools | Templates
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

/**
 *
 * @author Admin
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Username = request.getParameter("username");
        String Password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        String Email = request.getParameter("email");
        String FirstName = request.getParameter("firstname");
        String fthai = new String(FirstName.getBytes("ISO8859_1"),"UTF-8");
        String LastName = request.getParameter("lastname");
        String lthai = new String(LastName.getBytes("ISO8859_1"),"UTF-8");
        String Phone = request.getParameter("phone");
//String Created = request.getParameter("created");
        String msg = "kuy";
        Boolean complete = false;

        Accounts a = new Accounts();

        if (Accounts.checkDuplicatedUser(Username) == 0) {
            if (Password.length() >= 6) {
                if (Password.equals(confirmpassword)) {
                    if (Accounts.checkEmail(Email)) {
                            int row = Accounts.addAccount(Username,Password,Email,fthai,lthai,Phone);
                            if (row == 1) {
                                msg = "Congratulations, you are now a member of GoToTheSell!";
                                request.setAttribute("msg", msg);
                                complete = true;
                                 System.out.println("1");
                            } else {
                                msg = "Database is not updated, please contact administrator.";
                                request.setAttribute("msg", msg);
                                complete = false;
                                System.out.println("2");
                            }
                        
                    } else {
                        msg = "Wrong email gormat, please re-enter.";
                        request.setAttribute("msg", msg);
                        complete = false;
                        System.out.println("3");
                    }
                } else {
                    msg = "Password not matched.";
                    request.setAttribute("msg", msg);
                    complete = false;
                    System.out.println("4");
                }
            } else {
                msg = "Password length should more than 5 characters.";
                request.setAttribute("msg", msg);
                complete = false;
                System.out.println("5");
            }
        } else {
            msg = "Duplicated username, please re-enter.";
            request.setAttribute("msg", msg);
            complete = false;
            System.out.println("6");
        }

        if (complete) {
            getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
        } else {
            System.out.println("hhhhh");
            getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
        } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
