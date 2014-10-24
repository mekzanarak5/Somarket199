/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Array;
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
public class Category {

    private int cateID;
    private String cateName;
    private int ParentCateID;
    private String Value;

    public Category(int cateID, String cateName, int ParentCateID, String Value) {
        this.cateID = cateID;
        this.cateName = cateName;
        this.ParentCateID = ParentCateID;
        this.Value = Value;
    }

    public Category() {

    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public int getParentCateID() {
        return ParentCateID;
    }

    public void setParentCateID(int ParentCateID) {
        this.ParentCateID = ParentCateID;
    }

    public String getValue() {
        return Value;
    }

    public void setValue(String Value) {
        this.Value = Value;
    }

    @Override
    public String toString() {
        return "catagory{" + "cateID=" + cateID + ", cateName=" + cateName + ", ParentCateID=" + ParentCateID + ", Value=" + Value + '}';
    }

    public static List<Category> findBigAll() {
        String sqlCmd = "SELECT * FROM category where ParentCateID is null";
        Connection con = ConnectionAgent.getConnection();
        Category c = null;
        List<Category> ca = new ArrayList<Category>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Category();
                rToO(c, rs);
                ca.add(c);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ca;
    }

    public static List<Category> findBigP(int cateID) {
        String sqlCmd = "SELECT * FROM category where ParentCateID = ?";
        Connection con = ConnectionAgent.getConnection();
        Category c = null;
        List<Category> ca = new ArrayList<Category>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, cateID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Category();
                rToO(c, rs);
                ca.add(c);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ca;
    }

    public static List<Category> findByParent1(List<Category> ids) {
        int currentId = 0;
//String sqlCmd = "SELECT * FROM CATEGORY where parentCateID IN ( ? )";
        Connection con = ConnectionAgent.getConnection();
        List<Category> ca = new ArrayList<Category>();
        Category c = null;

        for (Category category : ids) {
            currentId = category.getCateID();
            String sqlCmd = "SELECT * FROM category where ParentCateID IN ( " + currentId + " )";
            try {
                PreparedStatement ps = con.prepareStatement(sqlCmd);
// ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    c = new Category();
                    rToO(c, rs);
                    ca.add(c);
                }
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println(sqlCmd);
        }
        return ca;
    }

    public static Category findBySmall(int id) {

        String sqlCmd = "SELECT * FROM category where cateID = ?";
        Connection con = ConnectionAgent.getConnection();
        Category c = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Category();
                rToO(c, rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public static List<Category> findByParent(int id) {

        String sqlCmd = "SELECT * FROM category where ParentCateID = ?";
        Connection con = ConnectionAgent.getConnection();
        Category c = null;
        List<Category> ca = new ArrayList<Category>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Category();
                rToO(c, rs);
                ca.add(c);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ca;
    }

    public static List<Category> findByParent2(List<Category> ids) {
        int currentId = 0;
        String sqlCmd = "SELECT * FROM category where ParentCateID IN ( ? )";
        Connection con = ConnectionAgent.getConnection();
        List<Category> ca = new ArrayList<Category>();
        Category c = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
// ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Category();
                rToO(c, rs);
                ca.add(c);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(sqlCmd);
        return ca;
    }

    public static int addCatBig(String cateName, String ParentCateID, String Value) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(cateID) AS LastMemberID FROM category where ParentCateID is null");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }
            ParentCateID = null;
            PreparedStatement ps = con.prepareStatement("INSERT INTO category VALUES (?,?,?,current_timestamp,?)");
            ps.setInt(1, newMemberID);
            ps.setString(2, cateName);
            ps.setString(3, ParentCateID);
            ps.setString(4, Value);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static int addCatSmall(String cateName, String ParentCateID, String Value) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(cateID) AS LastMemberID FROM category where ParentCateID=?");
            ps1.setString(1, ParentCateID);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO category VALUES (?,?,?,current_timestamp,?)");
            ps.setInt(1, newMemberID);
            ps.setString(2, cateName);
            ps.setString(3, ParentCateID);
            ps.setString(4, Value);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static int addCatSmallF(String cateName, String Value) {
        int row = 0;
        int newMemberID1 = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps2 = con.prepareStatement("SELECT MAX(cateID) AS LastMemberID FROM category where ParentCateID is null");
            ResultSet rs1 = ps2.executeQuery();
            if (rs1.next()) {
                newMemberID1 = rs1.getInt(1);
            } else {
                newMemberID1 = 0;
            }
            int newMemberID = newMemberID1;
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(cateID) AS LastMemberID FROM category where cateID=?");
            ps1.setInt(1, newMemberID1);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) * 100;
            } else {
                newMemberID = 0;
            }
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO category VALUES (?,?,?,current_timestamp,?)");
            ps.setInt(1, newMemberID);
            ps.setString(2, cateName);
            ps.setInt(3, newMemberID1);
            ps.setString(4, Value);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static int lastid() {
        Connection con = ConnectionAgent.getConnection();
        int id = 0;
        try {
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(cateID) FROM category where ParentCateID is null");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    private static void rToO(Category c, ResultSet rs) {
        try {
            c.setCateID(rs.getInt("cateID"));
            c.setCateName(rs.getString("cateName"));
            c.setParentCateID(rs.getInt("ParentCateID"));
            c.setValue(rs.getString("Value"));

        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
