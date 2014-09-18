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
public class Product implements Comparable {
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

    public static int addProducts(String AcctID, int Category_ID, String Name, Double Price,
            String CreateOn, String Description, String Available, String Brand) {
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
            ps.setInt(3, Category_ID);
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

    public static Product findById(int id) {
        String sqlCmd = "SELECT * FROM product p WHERE productNO = ? ORDER BY productNO desc";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Product();
                rToO(p, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
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

    public static List<Product> showSell(int id) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE ACCTID = ?";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> pa = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
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
            ps.setInt(1, id);
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

    public static int lastid() {
        Connection con = ConnectionAgent.getConnection();
        int id = 0;
        try {
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(PRODUCTNO) FROM PRODUCT");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public static Product findByName(String name) {
        String sqlCmd = "SELECT * FROM product p WHERE product_name LIKE '%?%' ORDER BY product_id desc";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Product();
                rToO(p, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public static List<Product> search(String str, String id) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE Description like ? OR name like ? and Category_ID like ? ORDER BY CreateOn DESC";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, "%" + str + "%");
            ps.setString(2, str + "%");
            ps.setString(3, id + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static List<Product> findPrice(String key,String id, int x, int y,double str, double st) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE Description like ? and name like ? and Category_ID like ? and PRICE between ? and ? ORDER BY CreateOn DESC limit ?,?";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, key + "%");
            ps.setString(3, id + "%");
            ps.setDouble(4, str);
            ps.setDouble(5, st);
            ps.setInt(6, x);
            ps.setInt(7, y);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static List<Product> searchnotcat(String str) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE Description like ? OR name like ? ORDER BY CreateOn DESC";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, "%" + str + "%");
            ps.setString(2, str + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static int deleteProduct(String productid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM PRODUCT WHERE PRODUCTNO=?");
            ps.setString(1, productid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static ArrayList<Product> page(String key,String id, int x, int y) {
        ArrayList<Product> ar = new ArrayList<Product>();
        try {
            String sql = "select * from product where Description like ? OR name like ? and Category_ID like ? ORDER BY CreateON DESC limit ?,?";
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, key + "%");
            ps.setString(3, id + "%");
            ps.setInt(4, x);
            ps.setInt(5, y);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                rToO(p, rs);
                ar.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }
    public static ArrayList<Product> highPrice(String key,String id, int x, int y) {
        ArrayList<Product> ar = new ArrayList<Product>();
        try {
            String sql = "select * from product where Description like ? OR name like ? and Category_ID like ? ORDER BY PRICE DESC limit ?,?";
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, key + "%");
            ps.setString(3, id + "%");
            ps.setInt(4, x);
            ps.setInt(5, y);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                rToO(p, rs);
                ar.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }
public static ArrayList<Product> LowPrice(String key,String id, int x, int y) {
        ArrayList<Product> ar = new ArrayList<Product>();
        try {
            String sql = "select * from product where Description like ? OR name like ? and Category_ID like ? ORDER BY PRICE ASC limit ?,?";
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, key + "%");
            ps.setString(3, id + "%");
            ps.setInt(4, x);
            ps.setInt(5, y);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                rToO(p, rs);
                ar.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }
    public static int countRow(String key) {
        try {
            String sql = "select count(productno) from product where name like ?";
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + key.trim() + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    public static int countRowp(String key,double str, double st) {
        try {
            String sql = "select count(productno) from product where name like ? and PRICE between ? and ?";
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + key.trim() + "%");
            ps.setDouble(2, str);
            ps.setDouble(3, st);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

      public static int editCategory(int proid,int cat) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE product SET Category_ID=? WHERE productNO=?");
            ps.setInt(1, cat);
            ps.setInt(2, proid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
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

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 79 * hash + this.productNO;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Product other = (Product) obj;
        if (this.productNO != other.productNO) {
            return false;
        }
        return true;
    }

    @Override
    public int compareTo(Object o) {
        if(!(o instanceof Product))return 0;
        Product n=(Product)o;
        return acctID-n.getAcctID();
    }
    
}
