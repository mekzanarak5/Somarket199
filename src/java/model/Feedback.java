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
import java.util.logging.Level;
import java.util.logging.Logger;
import static model.order.toO;

/**
 *
 * @author Mekza
 */
public class Feedback {
    private String acct;
    private int fid;
    private int order;
    private String comment;
    private String type;
    private Timestamp date;
    private int rate;

    public Feedback() {
    }

    public Feedback(String acct, int fid, int order, String comment, String type, Timestamp date, int rate) {
        this.acct = acct;
        this.fid = fid;
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
        return "Feedback{" + "acct=" + acct + ", fid=" + fid + ", order=" + order + ", comment=" + comment + ", type=" + type + ", date=" + date + ", rate=" + rate + '}';
    }
    
    public int add(Feedback f) {
        int value = 0;
        String sql = "insert into feedback(Account_Id,OrderID,type,comment,Date,rate) values(?,?,?,?,CURRENT_TIMESTAMP,?)";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, f.getAcct());
            ps.setInt(2, f.getOrder());
            ps.setString(3, f.getType());
            ps.setString(4, f.getComment());
            ps.setInt(5, f.getRate());
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
        String sqlCmd = "SELECT * from feedback f where f.OrderId = ? and f.Account_Id ";
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
    
    public static Feedback toO(ResultSet rs) {
        Feedback f = null;
        try {
            f = new Feedback();
            f.setFid(rs.getInt(1));
            f.setAcct(rs.getString(2));
            f.setOrder(rs.getInt(3));
            f.setType(rs.getString(4));
            f.setComment(rs.getString(5));
            f.setDate(rs.getTimestamp(6));
            f.setRate(rs.getInt(7));

        } catch (SQLException ex) {
            Logger.getLogger(Feedback.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
    
}
