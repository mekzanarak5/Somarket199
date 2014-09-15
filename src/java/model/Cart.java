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
        String sql = "insert into gadget_order2 values(?,?,?,?,?)";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, getOrderId());
            List<LineItem> a = getLineItems();
            System.out.println(a);
            for (LineItem li : a) {
                if (key == li.getProduct().getAcctID()) {
                    ps.setInt(2, li.getUnit());
                    ps.setString(3, li.getProduct().getName());
                    ps.setDouble(4, li.getProduct().getPrice());
                    ps.setDouble(5, li.getTotal());
                    ps.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static Cart getDetailList(int oid) {
        Cart c = new Cart();
        String sql = "select * from gadget_order2 where order_id = ? ";
        PreparedStatement ps;
        try {
            ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                LineItem li = new LineItem(Product.findByName(rs.getString(3)), rs.getInt(2));
                c.add(li);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public static int idGenerator() {
        String sql = "select max(ORDER_ID) from gadget_order";
        int result = 0;
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1) + 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

}
