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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class Address {

    private int Address_Id;
    private int AcctNo;
    private String Address;
    private String Provice;
    private int Post;
    private String Canton;

    public Address(int Address_Id, int AcctNo, String Address, String Provice, int Post, String Canton) {
        this.Address_Id = Address_Id;
        this.AcctNo = AcctNo;
        this.Address = Address;
        this.Provice = Provice;
        this.Post = Post;
        this.Canton = Canton;
    }

    public Address() {

    }

    public int getAddress_Id() {
        return Address_Id;
    }

    public void setAddress_Id(int Address_Id) {
        this.Address_Id = Address_Id;
    }

    public int getAcctNo() {
        return AcctNo;
    }

    public void setAcctNo(int AcctNo) {
        this.AcctNo = AcctNo;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getProvice() {
        return Provice;
    }

    public void setProvice(String Provice) {
        this.Provice = Provice;
    }

    public int getPost() {
        return Post;
    }

    public void setPost(int Post) {
        this.Post = Post;
    }

    public String getCanton() {
        return Canton;
    }

    public void setCanton(String Canton) {
        this.Canton = Canton;
    }

    public static int addAdress(int AcctNo, String Address, String Provice, int Post, String Canton) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(Address_Id) AS LastMemberID FROM address");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO address VALUES (?,?,?,?,?,?)");
            ps.setInt(1, newMemberID);
            ps.setInt(2, AcctNo);
            ps.setString(3, Address);
            ps.setString(4, Provice);
            ps.setInt(5, Post);
            ps.setString(6, Canton);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static int editAddress(String Address, String Provice, String Canton, int Post, int Address_Id) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE address SET Address=?,Provice=?,Post=?,Canton=?  WHERE Address_Id=?");
            ps.setString(1, Address);
            ps.setString(2, Provice);
            ps.setInt(3, Post);
            ps.setString(4, Canton);
            ps.setInt(5, Address_Id);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }

    public static List<Address> showAddress(int id) {
        String sqlCmd = "SELECT * FROM address WHERE AcctNo = ?";
        Connection con = ConnectionAgent.getConnection();
        Address a = null;
        List<Address> pa = new ArrayList<Address>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = new Address();
                rToO(a, rs);
                pa.add(a);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pa;
    }

    public static Address findAddress(int id) {
        String sqlCmd = "SELECT * FROM address WHERE Address_Id = ?";
        Connection con = ConnectionAgent.getConnection();
        Address a = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Address();
                rToO(a, rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public static int lastid() {
        Connection con = ConnectionAgent.getConnection();
        int id = 0;
        try {
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(Address_Id) FROM address");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public static boolean checkAddr(int id) {
        String sqlCmd = "SELECT * FROM address WHERE AcctNo = ?";
        Connection con = ConnectionAgent.getConnection();
        boolean k = false;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                k=true;
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return k;
    }

    public static int deleteAddress(String addid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM address WHERE Address_Id=?");
            ps.setString(1, addid);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    private static void rToO(Address a, ResultSet rs) {
        try {
            a.setAddress_Id(rs.getInt("Address_Id"));
            a.setAcctNo(rs.getInt("AcctNo"));
            a.setAddress(rs.getString("Address"));
            a.setProvice(rs.getString("Provice"));
            a.setPost(rs.getInt("Post"));
            a.setCanton(rs.getString("Canton"));
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
