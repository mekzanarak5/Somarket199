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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static model.order.toO;

/**
 *
 * @author Mekza
 */
public class Feedback {
    
    private int fid;
    private String acct;
    private String from;
    private int order;
    private String comment;
    private String type;
    private Timestamp date;
    private int rate;

    public Feedback() {
    }

    public Feedback(int fid, String acct, String from, int order, String comment, String type, Timestamp date, int rate) {
        this.fid = fid;
        this.acct = acct;
        this.from = from;
        this.order = order;
        this.comment = comment;
        this.type = type;
        this.date = date;
        this.rate = rate;
    }

    public String getAcct() {
        return acct;
    }

    public void setAcct(String acct) {
        this.acct = acct;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }
    
    

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "Feedback{" + "fid=" + fid + ", acct=" + acct + ", from=" + from + ", order=" + order + ", comment=" + comment + ", type=" + type + ", date=" + date + ", rate=" + rate + '}';
    }
    
    public int add(Feedback f) {
        int value = 0;
        String sql = "insert into feedback(Account_Id,From_u,OrderID,type,comment,Date,rate) values(?,?,?,?,?,CURRENT_TIMESTAMP,?)";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, f.getAcct());
            ps.setString(2, f.getFrom());
            ps.setInt(3, f.getOrder());
            ps.setString(4, f.getType());
            ps.setString(5, f.getComment());
            ps.setInt(6, f.getRate());
            value = ps.executeUpdate();
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(Feedback.class.getName()).log(Level.SEVERE, null, ex);
        }
        return value;
    }
    
    public static void update(String kind, String key) {
        String sql = "update feedback set" + kind + " = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, key);
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void delete(int id) {
        String sql = "delete from feedback where feedback_id = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static int getLastedID() {
        String sqlCmd = "select MAX(feedback_id) from feedback";
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

    public static ArrayList<Feedback> search(String key, String kind) {
        ArrayList<Feedback> f = new ArrayList<Feedback>();
        String sql = "select * from feedback where " + kind + "=? order by Date";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, key);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f.add(toO(rs));
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(Feedback.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
    
    public static Feedback searchByID(int id) {
        Feedback f = null;
        String sql = "select * from feedback where feedback_id = ?";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                f = toO(rs);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
    
    public static Feedback checkFeedback(int ord, String user) {
        String sqlCmd = "SELECT * from feedback f where f.OrderId = ? and f.Account_Id = ?";
        Connection con = ConnectionAgent.getConnection();
        Feedback cs = new Feedback();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, ord);
            ps.setString(2, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cs = toO(rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    
    public static Feedback checkSender(int ord, String user) {
        String sqlCmd = "SELECT * from feedback f where f.OrderID = ? and f.From_u like ?";
        Connection con = ConnectionAgent.getConnection();
        Feedback cs = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, ord);
            ps.setString(2, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               cs = toO(rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    
    public static List<Feedback> orderFeedback(int ord) {
        String sqlCmd = "SELECT * from feedback f where f.OrderId = ? ";
        Connection con = ConnectionAgent.getConnection();
        List<Feedback> io = new ArrayList<Feedback>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, ord);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                io.add(toO(rs));
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return io;
    }
    
    public static ArrayList<Feedback> getFeedList(String user) {
        ArrayList<Feedback> arr = new ArrayList<Feedback>();
        String sql = "select * from feedback where Account_Id like ? order by Feedback_Id";
        PreparedStatement ps;
        try {
            ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback o = toO(rs);
                arr.add(o);
            }
            ConnectionAgent.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(Feedback.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }
    public static double feedAVG(String str) {
        String sqlCmd = "SELECT avg(rate) FROM feedback WHERE Account_Id = ?";
        Connection con = ConnectionAgent.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getDouble(1);

        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public static int feedcount(String str) {
        String sqlCmd = "SELECT count(*) FROM feedback WHERE Account_Id = ?";
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
    public static Feedback toO(ResultSet rs) {
        Feedback f = null;
        try {
            f = new Feedback();
            f.setFid(rs.getInt(1));
            f.setAcct(rs.getString(2));
            f.setFrom(rs.getNString(3));
            f.setOrder(rs.getInt(4));
            f.setType(rs.getString(5));
            f.setComment(rs.getString(6));
            f.setDate(rs.getTimestamp(7));
            f.setRate(rs.getInt(8));

        } catch (SQLException ex) {
            Logger.getLogger(Feedback.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
    
}
