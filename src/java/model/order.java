/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sorn
 */
public class order {

    private int orderId;
    private String username;
    private double total;
    private int address;
    private Timestamp time;
    private int bankacct;
    private String payment;
    private String slip;
    private String status;
    private String ems;
    private String seller;

    public order() {
    }

    public order(int orderId, String username, double total, int address, Timestamp time, int bankacct, String payment, String slip, String status, String ems, String seller) {
        this.orderId = orderId;
        this.username = username;
        this.total = total;
        this.address = address;
        this.time = time;
        this.bankacct = bankacct;
        this.payment = payment;
        this.slip = slip;
        this.status = status;
        this.ems = ems;
        this.seller = seller;
    }

    public int getBankacct() {
        return bankacct;
    }

    public void setBankacct(int bankacct) {
        this.bankacct = bankacct;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public int getAddress() {
        return address;
    }

    public void setAddress(int address) {
        this.address = address;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getSlip() {
        return slip;
    }

    public void setSlip(String slip) {
        this.slip = slip;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEms() {
        return ems;
    }

    public void setEms(String ems) {
        this.ems = ems;
    }

    @Override
    public String toString() {
        return "order{" + "orderId=" + orderId + ", username=" + username + ", total=" + total + ", address=" + address + ", time=" + time + ", bankacct=" + bankacct + ", payment=" + payment + ", slip=" + slip + ", status=" + status + ", ems=" + ems + ", seller=" + seller + '}';
    }

    public int add(order o) {
        int value = 0;
        String sql = "insert into order_sum(OrderNo,user,seller,TotalPrice,Created,Detail,payment,slip,TrackingNo) values(?,?,?,?,CURRENT_TIMESTAMP,?,?,?,?)";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, o.getOrderId());
            ps.setString(2, o.getUsername());
            ps.setString(3, o.getSeller());
            //ps.setString(3, o.getAddress());
            ps.setDouble(4, o.getTotal());
            ps.setString(5, "Waiting for payment.");
            if (payment == null) {
                ps.setNull(6, java.sql.Types.VARCHAR);
            } else {
                ps.setString(6, payment);
            }
            if (slip == null) {
                ps.setNull(7, java.sql.Types.VARCHAR);
            } else {
                ps.setString(7, slip);
            }
            if (ems == null) {
                ps.setNull(8, java.sql.Types.VARCHAR);
            } else {
                ps.setString(8, ems);
            }
            value = ps.executeUpdate();
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return value;
    }

    public static void update(String kind, String key) {
        String sql = "update order_sum set" + kind + " = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, key);
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void delete(int id) {
        String sql = "delete from order_sum where OrderNo = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ArrayList<order> getOrderList(String user) {
        ArrayList<order> arr = new ArrayList<order>();
        String sql = "select * from order_sum where user like ? order by OrderNo";
        PreparedStatement ps;
        try {
            ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order o = toO(rs);
                arr.add(o);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }

    public static double getTotalPriceOrder(int acctno) {
        String sql = "select sum(o.total)\n"
                + "from order_product o\n"
                + "join order_sum c on o.ORDER_id = c.ORDERno \n"
                + "where accountid = ?";

        double result = 0;
        PreparedStatement ps;
        try {
            ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, acctno);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getDouble(1);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static int getLastedID() {
        String sqlCmd = "select MAX(OrderNo) from order_sum";
        int value = 1;
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sqlCmd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                value = rs.getInt(1) + 1;
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return value;
    }

    public static ArrayList<order> search(String key, String kind) {
        ArrayList<order> o = new ArrayList<order>();
        String sql = "select * from order_sum where " + kind + "=? order by Created";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, key);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o.add(toO(rs));
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

    public static order searchByID(int id) {
        order o = null;
        String sql = "select * from order_sum where OrderNo = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                o = toO(rs);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }
    
    
    public static boolean checkProductOrder(int id) {
        String sqlCmd = "SELECT * FROM order_product WHERE Product_ID = ?";
        Connection con = ConnectionAgent.getConnection();
        boolean k = false;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                k=true;
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return k;
    }

    public static order toO(ResultSet rs) {
        order o = null;
        try {
            o = new order();
            o.setOrderId(rs.getInt(1));
            o.setUsername(rs.getString(2));
            o.setSeller(rs.getString(3));
            o.setTotal(rs.getDouble(4));
            o.setTime(rs.getTimestamp(5));
            o.setStatus(rs.getString(6));
            o.setAddress(rs.getInt(7));
            o.setBankacct(rs.getInt(8));
            o.setPayment(rs.getString(9));
            o.setSlip(rs.getString(10));
            o.setEms(rs.getString(11));

        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

    public static void addBank(int order_id, int bank) {
        String sql = "update order_sum set bankacct=? where OrderNo = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, bank);
            ps.setInt(2, order_id);
            ps.executeUpdate();
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void addSlip(int order_id, String slip) {
        String sql = "update order_sum set slip=? where OrderNo = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, slip);
            ps.setInt(2, order_id);
            ps.executeUpdate();
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void addAddr(int order_id, int addr) {
        String sql = "update order_sum set Address=? where OrderNo = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, addr);
            ps.setInt(2, order_id);
            ps.executeUpdate();
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void addPayment(int order_id, String pay) {
        String sql = "update order_sum set payment=?, detail=? where OrderNo = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, pay);
            ps.setString(2, "Verifying... ");
            ps.setInt(3, order_id);
            ps.executeUpdate();
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void addEms(int order_id, String status, String ems) {
        String sql = "update order_sum set Detail = ?, TrackingNo = ? where OrderNo = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, ems);
            ps.setInt(3, order_id);
            ps.executeUpdate();
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<order> showAll() {
        order o = null;
        List<order> cs = new ArrayList<order>();
        String sql = "select * from order_sum order by Created desc";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new order();
                o = toO(rs);
                cs.add(o);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static order countBuy(String id) {

        String sqlCmd = "SELECT count(*) FROM order_sum where user like ?";
        Connection con = ConnectionAgent.getConnection();
        order c = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new order();
                c = toO(rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
}
