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
    private String ParentCateID;
    private String Value;

    public Category(int cateID, String cateName, String ParentCateID, String Value) {
        this.cateID = cateID;
        this.cateName = cateName;
        this.ParentCateID = ParentCateID;
        this.Value = Value;
    }

    private Category() {

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

    public String getParentCateID() {
        return ParentCateID;
    }

    public void setParentCateID(String ParentCateID) {
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
        String sqlCmd = "SELECT * FROM CATEGORY where parentCateID is null";
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
        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ca;
    }

    public static List<Category> findBigP() {
        String sqlCmd = "SELECT cateID FROM CATEGORY where parentCateID is null";
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
            String sqlCmd = "SELECT * FROM CATEGORY where parentCateID IN ( " + currentId + " )";
            try {
                PreparedStatement ps = con.prepareStatement(sqlCmd);
//            ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    c = new Category();
                    rToO(c, rs);
                    ca.add(c);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println(sqlCmd);
        }
        return ca;
    }

    public static List<Category> findByParent(int id) {

        String sqlCmd = "SELECT * FROM CATEGORY where parentCateID = ?";
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
        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ca;
    }

    public static List<Category> findByParent2(List<Category> ids) {
        int currentId = 0;
        String sqlCmd = "SELECT * FROM CATEGORY where parentCateID IN ( ? )";
        Connection con = ConnectionAgent.getConnection();
        List<Category> ca = new ArrayList<Category>();
        Category c = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
//            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Category();
                rToO(c, rs);
                ca.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(sqlCmd);
        return ca;
    }

    private static void rToO(Category c, ResultSet rs) {
        try {
            c.setCateID(rs.getInt("CATEID"));
            c.setCateName(rs.getString("CATENAME"));
            c.setParentCateID(rs.getString("PARENTCATEID"));
            c.setValue(rs.getString("VALUE"));
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
