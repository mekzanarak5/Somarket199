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
public class ProductPic {
    private int pNO;
    private int Product_Id;
    private String pathFile;
    private String CreateOn;

    public ProductPic() {
    }

    public ProductPic(int pNO, int Product_Id, String pathFile, String CreateOn) {
        this.pNO = pNO;
        this.Product_Id = Product_Id;
        this.pathFile = pathFile;
        this.CreateOn = CreateOn;
    }

    public int getpNO() {
        return pNO;
    }

    public void setpNO(int pNO) {
        this.pNO = pNO;
    }

    public int getProduct_Id() {
        return Product_Id;
    }

    public void setProduct_Id(int Product_Id) {
        this.Product_Id = Product_Id;
    }

    public String getPathFile() {
        return pathFile;
    }

    public void setPathFile(String pathFile) {
        this.pathFile = pathFile;
    }

    public String getCreateOn() {
        return CreateOn;
    }

    public void setCreateOn(String CreateOn) {
        this.CreateOn = CreateOn;
    }
    
    public static int insertPic(List<String> path) {
        int row = 0;
        int newMemberID = 0;
        int newMemberID1 = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            
            PreparedStatement ps2 = con.prepareStatement("SELECT MAX(PRODUCTNO) AS LastMemberID FROM PRODUCT");
            ResultSet rs1 = ps2.executeQuery();
            if (rs1.next()) {
                newMemberID1 = rs1.getInt(1) + 1;
            } else {
                newMemberID1 = 0;
            }
            for (String pa : path) {
                
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(pNO) AS LastMemberID FROM product_img");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }
            PreparedStatement ps = con.prepareStatement("INSERT INTO product_img VALUES (?,?,?,current_timestamp)");
            ps.setInt(1, newMemberID);
            ps.setInt(2, newMemberID1);
            ps.setString(3, pa);
            
            row = ps.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductPic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static List<ProductPic> find(int str) {
        String sqlCmd = "SELECT * FROM product_img WHERE product_id like ?";
        Connection con = ConnectionAgent.getConnection();
        ProductPic p = null;
        List<ProductPic> cs = new ArrayList<ProductPic>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductPic();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductPic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    
    public static ProductPic findf(int str) {
        String sqlCmd = "SELECT * FROM product_img WHERE pNo = (SELECT MIN(pNo) FROM product_img where product_id=?)";
        Connection con = ConnectionAgent.getConnection();
        ProductPic p = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, str);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new ProductPic();
                rToO(p, rs);
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductPic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    private static void rToO(ProductPic p, ResultSet rs) {
        try {
            p.setpNO(rs.getInt("pno"));
            p.setProduct_Id(rs.getInt("product_id"));
            p.setPathFile(rs.getString("pathfile"));
            p.setCreateOn(rs.getString("createon"));
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductPic.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public static int deletePic(String picid) {
        int row = 0;
        try {
            
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM product_img WHERE pNo=?");
            ps.setString(1, picid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductPic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
}
