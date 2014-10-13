/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author INT303
 */
public class Cart {

    private TreeMap<Integer, LineItem> items;
    private int orderId;

    public Cart() {
        items = new TreeMap<Integer, LineItem>();
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void add(LineItem li) {
        LineItem tmp = items.get(li.getProduct().getProductNO());
        if (tmp == null) {
            items.put(li.getProduct().getProductNO(), li);
        } else {
            tmp.setUnit(li.getUnit() + tmp.getUnit());
        }
    }

    public double getTotal() {
        double total = 0;
        List<LineItem> items = getLineItems();
        for (LineItem lt : items) {
            total = total + lt.getUnit() * (lt.getProduct().getPrice());
        }
        return total;
    }

    public int getUnitItem() {
        return items.size();
    }

    public List<LineItem> getLineItems() {
        List<LineItem> lines = new ArrayList<>(items.values());
        return lines;
    }

    public TreeMap<Integer, LineItem> getItems() {
        return items;
    }

    public void setItems(TreeMap<Integer, LineItem> items) {
        this.items = items;
    }

    public void addDetail(int key) {
        String sql = "insert into order_product values(?,?,?,?)";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, Cart.idGenerator());
            List<LineItem> a = getLineItems();
            System.out.println(a);
            for (LineItem li : a) {
                if (li.getProduct().getAcctID() == key){
                    //ps.setInt(2, li.getUnit());
                    ps.setInt(2, li.getProduct().getProductNO());
                    ps.setDouble(3, li.getUnit());
                    ps.setDouble(4, li.getTotal());
                    ps.executeUpdate();
                }
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static Cart getDetailList(int oid) {
        Cart c = new Cart();
        String sql = "select * from order_product where order_id = ? ";
        PreparedStatement ps;
        try {
            ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                LineItem li = new LineItem(Product.findById(rs.getInt(2)), rs.getInt(3));
                c.add(li);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public static int idGenerator() {
        String sql = "SELECT MAX(Order_ID) FROM order_product";
        int result = 0;
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1) + 1;
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public static int LastByOrder() {
        String sql = "SELECT MAX(Product_ID) FROM order_product";
        int result = 0;
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

}
