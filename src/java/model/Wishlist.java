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
public class Wishlist {
    private int wish_Id;
    private int acct_Id;
    private String name;
    private double price;
    private String seller;

    public Wishlist() {
    }

    public Wishlist(int wish_Id, int acct_Id, String name, double price, String seller) {
        this.wish_Id = wish_Id;
        this.acct_Id = acct_Id;
        this.name = name;
        this.price = price;
        this.seller = seller;
    }

    public int getWish_Id() {
        return wish_Id;
    }

    public void setWish_Id(int wish_Id) {
        this.wish_Id = wish_Id;
    }

    public int getAcct_Id() {
        return acct_Id;
    }

    public void setAcct_Id(int acct_Id) {
        this.acct_Id = acct_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }
    
    public static int addWishlist(int acct_Id, String name,double price,String seller) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(wish_Id) AS LastMemberID FROM wishlist");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO wishlist VALUES (?,?,?,?,?)");
            ps.setInt(1, newMemberID);
            ps.setInt(2, acct_Id);
            ps.setString(3, name);
            ps.setDouble(4, price);
            ps.setString(5, seller);
            row = ps.executeUpdate();
con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Wishlist.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static List<Wishlist> showWishlist(int id) {
        String sqlCmd = "SELECT * FROM wishlist WHERE acct_Id = ?";
        Connection con = ConnectionAgent.getConnection();
        Wishlist a = null;
        List<Wishlist> pa = new ArrayList<Wishlist>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = new Wishlist();
                rToO(a, rs);
                pa.add(a);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Wishlist.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pa;
    }
     public static int deleteWishlist(String wishid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM wishlist WHERE wish_Id=?");
            ps.setString(1, wishid);
            row = ps.executeUpdate();
con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Wishlist.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
     private static void rToO(Wishlist a, ResultSet rs) {
        try {
            a.setWish_Id(rs.getInt("wish_Id"));
            a.setAcct_Id(rs.getInt("Acct_id"));
            a.setName(rs.getString("name"));
            a.setPrice(rs.getDouble("price"));
            a.setSeller(rs.getString("seller"));
        } catch (SQLException ex) {
            Logger.getLogger(Wishlist.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
