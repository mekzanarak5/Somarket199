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
    private int pNO;
    private int Product_Id;
    private String pathFile;
    private String CreateOn;

    public Product() {
    }

    public Product(int productNO, int acctID, int category_ID, String name, Double price, Date offerStart, Date offerEnd, Date createOn, String description, String available, int brandID, int pNO, int Product_Id, String pathFile, String CreateOn) {
        this.productNO = productNO;
        this.acctID = acctID;
        this.category_ID = category_ID;
        this.name = name;
        this.price = price;
        this.offerStart = offerStart;
        this.offerEnd = offerEnd;
        this.createOn = createOn;
        this.description = description;
        this.available = available;
        this.brandID = brandID;
        this.pNO = pNO;
        this.Product_Id = Product_Id;
        this.pathFile = pathFile;
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

    public static int addProducts(String AcctID, int Category_ID, String Name, Double Price,
            String CreateOn, String Description, String Available, String Brand) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(productNO) AS LastMemberID FROM product");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO product (productNO,AcctID,Category_ID,Name,Price,CreateOn,Description,Available,BrandID) VALUES (?,?,?,?,?,current_timestamp,?,?,?)");
            ps.setInt(1, newMemberID);
            ps.setString(2, AcctID);
            ps.setInt(3, Category_ID);
            ps.setString(4, Name);
            ps.setDouble(5, Price);
            ps.setString(6, Description);
            ps.setString(7, Available);
            ps.setString(8, Brand);
            row = ps.executeUpdate();
            con.close();
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public static List<Product> showProduct() {
        String sqlCmd = "SELECT * FROM product";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pa;
    }

    public static List<Product> showRandomProduct() {
        String sqlCmd = "select * from product p,product_img pi where p.productNO = pi.Product_Id Group by p.productNO ORDER BY RAND( ) DESC limit 4";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pa;
    }

    public static List<Product> showSell(int id) {
        String sqlCmd = "SELECT * FROM product p,product_img pi WHERE p.productNO = pi.Product_Id and AcctID = ? GROUP BY Product_Id";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pa;
    }

    public static Product showDetail(int id) {
        String sqlCmd = "SELECT * FROM product WHERE productNO = ?";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static Product countCateP(int id) {

        String sqlCmd = "SELECT count(*) FROM product p,category c WHERE p.Category_ID = c.cateID and c.ParentCateID = ?";
        Connection con = ConnectionAgent.getConnection();
        Product c = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Product();
                rToO(c, rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public static Product countCateS(int id) {

        String sqlCmd = "SELECT count(*) FROM product where Category_ID = ?";
        Connection con = ConnectionAgent.getConnection();
        Product c = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Product();
                rToO(c, rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public static int lastid() {
        Connection con = ConnectionAgent.getConnection();
        int id = 0;
        try {
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(productNO) FROM product");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public static Product findByName(String name) {
        String sqlCmd = "SELECT * FROM product p WHERE Name LIKE '%?%' ORDER BY productNO desc";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public static List<Product> search(String str, String id) {
        String sqlCmd = "SELECT * FROM product p,product_img pi WHERE p.productNO = pi.Product_Id or Description like ? OR Name like ? and Category_ID like ? GROUP BY pi.Product_Id ORDER BY p.CreateOn DESC";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static List<Product> findPrice(String key, String id, int x, int y, double str, double st) {
        String sqlCmd = "SELECT * FROM product WHERE Description like ? and Name like ? and Category_ID like ? and Price between ? and ? ORDER BY CreateOn DESC limit ?,?";
        String sqlCmd1 = "select * from product p,product_img pi where p.productNO = pi.Product_Id and (p.Description like ? or p.Name like ?) and p.Category_ID like ? and Price between ? and ? GROUP BY pi.Product_Id ORDER BY p.CreateON DESC limit ?,?";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd1);
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static List<Product> searchnotcat(String str) {
        String sqlCmd = "SELECT * FROM product WHERE Description like ? OR Name like ? ORDER BY CreateOn DESC";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static int deleteProduct(String productid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM product WHERE productNO=?");
            ps.setString(1, productid);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static ArrayList<Product> page(String key, String id, int x, int y) {
        ArrayList<Product> ar = new ArrayList<Product>();
        try {
            String sql = "select * from product p,product_img pi where p.productNO = pi.Product_Id and (p.Description like ? or p.Name like ?) and p.Category_ID like ? GROUP BY pi.Product_Id ORDER BY p.CreateON DESC limit ?,?";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }

    public static ArrayList<Product> highPrice(String key, String id, int x, int y) {
        ArrayList<Product> ar = new ArrayList<Product>();
        try {
            String sql = "select * from product p,product_img pi where p.productNO = pi.Product_Id and (p.Description like ? or p.Name like ?) and p.Category_ID like ? GROUP BY pi.Product_Id ORDER BY p.Price DESC limit ?,?";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }

    public static ArrayList<Product> LowPrice(String key, String id, int x, int y) {
        ArrayList<Product> ar = new ArrayList<Product>();
        try {
            String sql = "select * from product p,product_img pi where p.productNO = pi.Product_Id and (p.Description like ? or p.Name like ?) and p.Category_ID like ? GROUP BY pi.Product_Id ORDER BY p.Price ASC limit ?,?";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }

    public static int countRow(String key) {
        try {
            String sql = "select count(productNO) from product where Name like ?";
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + key.trim() + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
            con.close();
        } catch (Exception e) {
        }
        return 0;
    }

    public static int countRowp(String key, double str, double st) {
        try {
            String sql = "select count(productNO) from product where Name like ? and Price between ? and ?";
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + key.trim() + "%");
            ps.setDouble(2, str);
            ps.setDouble(3, st);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
            con.close();
        } catch (Exception e) {
        }
        return 0;
    }

    public static int editCategory(int proid, int cat) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE product SET Category_ID=? WHERE productNO=?");
            ps.setInt(1, cat);
            ps.setInt(2, proid);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }

    public static int editProduct(String name, double price, String des, String available, int cate, String brand, int productid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE product SET Name=?,Price=?,Description=?,Available=?,Category_ID=?,BrandID=?  WHERE productNO=?");
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, des);
            ps.setString(4, available);
            ps.setInt(5, cate);
            ps.setString(6, brand);
            ps.setInt(7, productid);

            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }

    private static void rToO(Product p, ResultSet rs) {
        try {
            p.setProductNO(rs.getInt("productNO"));
            p.setAcctID(rs.getInt("AcctID"));
            p.setCategory_ID(rs.getInt("Category_ID"));
            p.setName(rs.getString("Name"));
            p.setPrice(rs.getDouble("Price"));
            p.setOfferStart(rs.getDate("OfferStart"));
            p.setOfferEnd(rs.getDate("OfferEnd"));
            p.setCreateOn(rs.getDate("CreateOn"));
            p.setDescription(rs.getString("Description"));
            p.setAvailable(rs.getString("Available"));
            p.setBrandID(rs.getInt("BrandID"));
            p.setpNO(rs.getInt("pNO"));
            p.setProduct_Id(rs.getInt("Product_Id"));
            p.setPathFile(rs.getString("pathFile"));

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
        if (!(o instanceof Product)) {
            return 0;
        }
        Product n = (Product) o;
        return acctID - n.getAcctID();
    }

}
