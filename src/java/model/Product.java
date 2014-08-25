/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.Date;
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
public class Product {
    private int productNO;
    private int acctID;
    private int category_ID;
    private String name;
    private Double price;
    private Date offerStart;
    private Date offerEnd;
    private Date createOn;
    private String description;
    private String available;
    private int brandID;

    public Product() {
    }

    public int getProductNO() {
        return productNO;
    }

    public void setProductNO(int productNO) {
        this.productNO = productNO;
    }

    public int getAcctID() {
        return acctID;
    }

    public void setAcctID(int acctID) {
        this.acctID = acctID;
    }

    public int getCategory_ID() {
        return category_ID;
    }

    public void setCategory_ID(int category_ID) {
        this.category_ID = category_ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getOfferStart() {
        return offerStart;
    }

    public void setOfferStart(Date offerStart) {
        this.offerStart = offerStart;
    }

    public Date getOfferEnd() {
        return offerEnd;
    }

    public void setOfferEnd(Date offerEnd) {
        this.offerEnd = offerEnd;
    }

    public Date getCreateOn() {
        return createOn;
    }

    public void setCreateOn(Date createOn) {
        this.createOn = createOn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    @Override
    public String toString() {
        return "Product{" + "productNO=" + productNO + ", acctID=" + acctID + ", category_ID=" + category_ID + ", name=" + name + ", price=" + price + ", offerStart=" + offerStart + ", offerEnd=" + offerEnd + ", createOn=" + createOn + ", description=" + description + ", available=" + available + ", brandID=" + brandID + '}';
    }
    
     public static int addProducts(String AcctID, String Category_ID, String Name, Double Price,
            String CreateOn,String Description,String Available,String Brand) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(PRODUCTNO) AS LastMemberID FROM PRODUCT");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO PRODUCT (productNO,AcctID,Category_ID,Name,Price,CreateOn,Description,Available,BrandID) VALUES (?,?,?,?,?,current_timestamp,?,?,?)");
            ps.setInt(1, newMemberID);
            ps.setString(2, AcctID);
            ps.setString(3, Category_ID);
            ps.setString(4, Name);
            ps.setDouble(5, Price);
            ps.setString(6, Description);
            ps.setString(7, Available);
            ps.setString(8, Brand);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
     public static List<Product> showProduct() {
        String sqlCmd = "SELECT * FROM PRODUCT";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> pa = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                pa.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pa;
    }
     public static Product showDetail(int id) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE PRODUCTNO = ?";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Product();
                rToO(p, rs);
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
         public static int lastid(){
                Connection con = ConnectionAgent.getConnection();
                int id=0;
        try {
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(PRODUCTNO) FROM PRODUCT");
            ResultSet rs = ps1.executeQuery();
            if(rs.next()){
               id= rs.getInt(1);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    private static void rToO(Product p, ResultSet rs) {
        try {
            p.setProductNO(rs.getInt("productno"));
            p.setAcctID(rs.getInt("acctid"));
            p.setCategory_ID(rs.getInt("category_id"));
            p.setName(rs.getString("name"));
            p.setPrice(rs.getDouble("price"));
            p.setOfferStart(rs.getDate("offerstart"));
            p.setOfferEnd(rs.getDate("offerend"));
            p.setCreateOn(rs.getDate("createon"));
            p.setDescription(rs.getString("description"));
            p.setAvailable(rs.getString("available"));
            p.setBrandID(rs.getInt("brandid"));
            
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
