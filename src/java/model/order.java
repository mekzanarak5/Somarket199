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
    private String paydate;
    private String paytime;
    private Double payamount;
    private String slip;
    private String status;
    private String ems;
    private String seller;
    private String comment;

    public order() {
    }

    public order(int orderId, String username, double total, int address, Timestamp time, int bankacct, String paydate, String paytime, Double payamount, String slip, String status, String ems, String seller) {
        this.orderId = orderId;
        this.username = username;
        this.total = total;
        this.address = address;
        this.time = time;
        this.bankacct = bankacct;
        this.paydate = paydate;
        this.paytime = paytime;
        this.payamount = payamount;
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

    public String getPaydate() {
        return paydate;
    }

    public void setPaydate(String paydate) {
        this.paydate = paydate;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }

    public Double getPayamount() {
        return payamount;
    }

    public void setPayamount(Double payamount) {
        this.payamount = payamount;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int add(order o) {
        int value = 0;
        String sql = "insert into order_sum(OrderNo,user,seller,TotalPrice,Created,Detail,slip,TrackingNo) values(?,?,?,?,CURRENT_TIMESTAMP,?,?,?)";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, o.getOrderId());
            ps.setString(2, o.getUsername());
            ps.setString(3, o.getSeller());
            //ps.setString(3, o.getAddress());
            ps.setDouble(4, o.getTotal());
            ps.setString(5, "Waiting for payment.");
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
        String sql = "select * from order_sum where " + kind + "=? order by Created DESC";
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
                k = true;
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
            o.setPaydate(rs.getString(9));
            o.setPaytime(rs.getString(10));
            o.setPayamount(rs.getDouble(11));
            o.setSlip(rs.getString(12));
            o.setEms(rs.getString(13));
            o.setComment(rs.getString(14));

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

    public static List<order> findAllOrder() {
        String sqlCmd = "SELECT * FROM order_sum";
        Connection con = ConnectionAgent.getConnection();
        order a = null;
        List<order> cs = new ArrayList<order>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = new order();
                a = toO(rs);
                cs.add(a);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
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
    
    public static void upStat(int order_id, String stat) {
        String sql = "update order_sum set Detail = ? where OrderNo = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, stat);
            ps.setInt(2, order_id);
            ps.executeUpdate();
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void cancel(int order_id, String stat, String reas) {
        String sql = "update order_sum set Detail = ?, Comment = ? where OrderNo = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, stat);
            ps.setString(2, reas);
            ps.setInt(3, order_id);
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

    public static void addPayment(int order_id, String pd, String pt, double pa) {
        String sql = "update order_sum set paydate=?, paytime=?, payamount=?, detail=? where OrderNo = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, pd);
            ps.setString(2, pt);
            ps.setDouble(3, pa);
            ps.setString(4, "Verifying... ");
            ps.setInt(5, order_id);
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

    public static ArrayList<order> showAll() {
        order o = null;
        ArrayList<order> cs = new ArrayList<order>();
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
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
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

    public static ArrayList<order> sold(String key) {
        ArrayList<order> o = new ArrayList<order>();
        String sql = "select * from order_sum where seller=? and Detail='shipping' order by Created";
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

    public static int countsold(String key) {
        String sql = "select count(*) from order_sum where seller=? and Detail='shipping'";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, key);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int countsoldQ(String key) {
        String sql = "select sum(od.quantity) from order_sum os,order_product op where op.Order_ID=os.OrderNo and op.seller=? and op.Detail='shipping'";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, key);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int findCountBuy(String str) {
        String sqlCmd = "SELECT count(*) FROM order_sum WHERE user = ? and isread = 1 and Detail='shipping'";
        Connection con = ConnectionAgent.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);

        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int updateRead(int msg) {
        int row = 0;
        try {
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE order_sum SET isread=0  WHERE OrderNo=?");
            ps.setInt(1, msg);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }
public static int updateRead1(int msg) {
        int row = 0;
        try {
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE order_sum SET isread=1  WHERE OrderNo=?");
            ps.setInt(1, msg);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }
    public static int findCountSell(String str) {
        String sqlCmd = "SELECT count(*) FROM order_sum WHERE seller = ? and isreadOn = 1 and Detail in ('Verifying...','Waiting for payment.')";
        Connection con = ConnectionAgent.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);

        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int updateReadSell(int msg) {
        int row = 0;
        try {
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE order_sum SET isreadOn=0  WHERE OrderNo=?");
            ps.setInt(1, msg);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }
    public static int updateReadSell1(int msg) {
        int row = 0;
        try {
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE order_sum SET isreadOn=1  WHERE OrderNo=?");
            ps.setInt(1, msg);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }
    public static int findCountOrder(String str1,String str2) {
        String sqlCmd = "SELECT count(*) FROM order_sum WHERE Created like ? and Detail like ?";
        Connection con = ConnectionAgent.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str1+"%");
            ps.setString(2, str2+"%");
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);

        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
