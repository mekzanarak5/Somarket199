/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class admin {

    private String admin_Name;
    private String admin_Pass;

    public admin() {
    }

    public admin(String admin_Name, String admin_Pass) {
        this.admin_Name = admin_Name;
        this.admin_Pass = admin_Pass;
    }

    public String getAdmin_Name() {
        return admin_Name;
    }

    public void setAdmin_Name(String admin_Name) {
        this.admin_Name = admin_Name;
    }

    public String getAdmin_Pass() {
        return admin_Pass;
    }

    public void setAdmin_Pass(String admin_Pass) {
        this.admin_Pass = admin_Pass;
    }

    @Override
    public String toString() {
        return "admin{" + "admin_Name=" + admin_Name + ", admin_Pass=" + admin_Pass + '}';
    }

    public static admin findById(String id) {
        String sqlCmd = "SELECT * FROM admin WHERE admin_Name = ?";
        Connection con = ConnectionAgent.getConnection();
        admin a = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new admin();
                rToO(a, rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public boolean login(String username, String password) {
        String sql = "select admin_Pass from admin where admin_Name = ?";
        String pass = "";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pass = rs.getString("admin_Pass");
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (password.equals(pass)) {
            return true;
        } else {
            return false;
        }
    }

    private static void rToO(admin a, ResultSet rs) {
        try {
            a.setAdmin_Name(rs.getString("admin_Name"));
            a.setAdmin_Pass(rs.getString("admin_Pass"));

        } catch (SQLException ex) {
            Logger.getLogger(admin.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
