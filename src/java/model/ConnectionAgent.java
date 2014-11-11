
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionAgent {

    public static Connection getConnection() {
        Connection con = null;
        String driver = "com.mysql.jdbc.Driver";
        //jdbc:mysql://localhost/chanin_tasm?useUnicode=yes&characterEncoding=UTF-8
        //String url = "jdbc:mysql://bm-wallet.com:3306/bmwallet_boss";
        String url = "jdbc:mysql://128.199.143.42:3306/somarket?useUnicode=yes&characterEncoding=UTF-8";
//        String url = "jdbc:mysql://localhost/test1?useUnicode=yes&characterEncoding=UTF-8";

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, "somarket", "mekza199");
//            con = DriverManager.getConnection(url, "root", "");
            System.out.println("Connection Complete");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            System.out.println("Can't connect");
        }
        return con;

    }

    public static void main(String[] args) {
        ConnectionAgent.getConnection();
    }
}