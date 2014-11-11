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
    private int productId;
    private int acct;

    public Wishlist() {
    }

    public Wishlist(int wish_Id, int acct_Id, String name, double price, String seller, int productId, int acct) {
        this.wish_Id = wish_Id;
        this.acct_Id = acct_Id;
        this.name = name;
        this.price = price;
        this.seller = seller;
        this.productId = productId;
        this.acct = acct;
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

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getAcct() {
        return acct;
    }

    public void setAcct(int acct) {
        this.acct = acct;
    }

    @Override
    public String toString() {
        return "Wishlist{" + "wish_Id=" + wish_Id + ", acct_Id=" + acct_Id + ", name=" + name + ", price=" + price + ", seller=" + seller + ", productId=" + productId + ", acct=" + acct + '}';
    }

    public static int addWishlist(int acct_Id, String name, double price, String seller, int productId, int acct) {
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

            PreparedStatement ps = con.prepareStatement("INSERT INTO wishlist VALUES (?,?,?,?,?,?,?)");
            ps.setInt(1, newMemberID);
            ps.setInt(2, acct_Id);
            ps.setString(3, name);
            ps.setDouble(4, price);
            ps.setString(5, seller);
            ps.setInt(6, productId);
            ps.setInt(7, acct);
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

    public static Wishlist searchByID(int id,int pid) {
        Wishlist a = null;
        String sql = "select * from wishlist where acct_Id = ? and productId = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, pid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Wishlist();
                rToO(a, rs);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(Wishlist.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public static int findCountWish(int str, int id) {
        String sqlCmd = "SELECT count(productId) as total FROM wishlist WHERE acct_id = ? and productId = ? GROUP BY productId";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Message> cs = new ArrayList<Message>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, str);
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);

        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
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

    public static int deleteWishlistPro(String wishid, String id) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM wishlist WHERE productId=? and acct_Id=?");
            ps.setString(1, wishid);
            ps.setString(2, id);
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
            a.setProductId(rs.getInt("productId"));
            a.setAcct(rs.getInt("acct"));
        } catch (SQLException ex) {
            Logger.getLogger(Wishlist.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
