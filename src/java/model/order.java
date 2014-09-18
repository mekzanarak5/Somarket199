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
   private String address;
   private Timestamp time;
   private String payment;
   private String slip;
   private String status;
   private String ems;
   private int acctno;

    public order() {
    }

    public order(int orderId, String username, double total, String address, Timestamp time, String slip, String status, String ems) {
        this.orderId = orderId;
        this.username = username;
        this.total = total;
        this.address = address;
        this.time = time;
        this.slip = slip;
        this.status = status;
        this.ems = ems;
    }

    public int getAcctno() {
        return acctno;
    }

    public void setAcctno(int acctno) {
        this.acctno = acctno;
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
    
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
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
        return "order{" + "orderId=" + orderId + ", username=" + username + ", total=" + total + ", address=" + address + ", time=" + time + ", slip=" + slip + ", status=" + status + ", ems=" + ems + '}';
    }
    
    public int add(order o){
       int value = 0;
       String sql = "insert into order_sum(OrderNo,AccountID,TotalPrice,Created,Detail,payment,slip,TrackingNo) values(?,?,?,CURRENT_TIMESTAMP,?,?,?,?)";
       try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, o.getOrderId());
            ps.setInt(2, o.getAcctno());
            //ps.setString(3, o.getAddress());
            ps.setDouble(3, o.getTotal());
            ps.setString(4, "Not Paid");
            if (payment == null) {
                ps.setNull(5, java.sql.Types.VARCHAR);
            } else {
                ps.setString(5, payment);
            }
            if (slip == null) {
                ps.setNull(6, java.sql.Types.VARCHAR);
            } else {
                ps.setString(6, slip);
            }
            if (ems == null) {
                ps.setNull(7, java.sql.Types.VARCHAR);
            } else {
                ps.setString(7, ems);
            }
            value = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
       return value; 
    }
    
    public static void update(String kind, String key) {
        String sql= "update order_sum set" + kind + " = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, key);
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void delete(int id) {
        String sql = "delete from order_sum where orderno = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
    public static ArrayList<order> getOrderList(int acctno) {
        ArrayList<order> arr = new ArrayList<order>();
        String sql = "select * from order_sum where accountid like ? order by orderno";
        PreparedStatement ps;
       try {
           ps = ConnectionAgent.getConnection().prepareStatement(sql);
           ps.setInt(1, acctno);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order o = new order();
                o.setOrderId(rs.getInt(1));              
                o.setUsername(rs.getString(2));
                o.setAddress(rs.getString(3));
                o.setTime(rs.getTimestamp(4));
                o.setTotal(rs.getDouble(5));
                arr.add(o);
            }
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
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public static int getLastedID() {
        String sqlCmd = "select MAX(orderno) from order_sum";
        int value = 1;
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sqlCmd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                value = rs.getInt(1)+1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return value;
    }
    
    public static ArrayList<order> search(String key, String kind) {
        ArrayList<order> o = new ArrayList<order>();
        String sql = "select * from order_sum where " + kind + "=? order by created";
        try {
           PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, key);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                o.add(toO(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }
    
    public static order searchByID(int id){
        order o = null;
        String sql = "select * from order_sum where orderno = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
             o = toO(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }
    
    
     public static order toO(ResultSet rs) {
        order o = null;
        try {
            o = new order();
            o.setOrderId(rs.getInt(1));
            o.setUsername(rs.getString(2));
            o.setAddress(rs.getString(3));
            o.setTime(rs.getTimestamp(4));
            o.setTotal(rs.getDouble(5));
            o.setStatus(rs.getString(6));
            o.setSlip(rs.getString(7));
            o.setEms(rs.getString(8));
            
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }
     
     public static void addSlip(int order_id, String slip){
         String sql = "update order_sum set slip=? where orderno = ?";
       try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, slip);
            ps.setInt(2, order_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
     
      public static void addEms(int order_id,String status,String ems){
          String sql = "update order_sum set detail = ?, trackingno = ? where orderno = ?";
       try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, ems);
            ps.setInt(3, order_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
      
      public static List<order> showAll() {
        order o = null;
        List<order> cs = new ArrayList<order>();
        String sql = "select * from order_sum order by created desc";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new order();
                o = toO(rs);
                cs.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
      
}
