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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class Message {

    private int MsgID;
    private String Subject;
    private int Sender;
    private int Receiver;
    private String pm;
    private String time;
    private String username;
    private int Read;

    public Message(int MsgID, String Subject, int Sender, int Receiver, String pm, String time, String username) {
        this.MsgID = MsgID;
        this.Subject = Subject;
        this.Sender = Sender;
        this.Receiver = Receiver;
        this.pm = pm;
        this.time = time;
        this.username = username;
    }

    public Message() {

    }

    public int getMsgID() {
        return MsgID;
    }

    public void setMsgID(int MsgID) {
        this.MsgID = MsgID;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String Subject) {
        this.Subject = Subject;
    }

    public int getSender() {
        return Sender;
    }

    public void setSender(int Sender) {
        this.Sender = Sender;
    }

    public int getReceiver() {
        return Receiver;
    }

    public void setReceiver(int Receiver) {
        this.Receiver = Receiver;
    }

    public String getPm() {
        return pm;
    }

    public void setPm(String pm) {
        this.pm = pm;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getRead() {
        return Read;
    }

    public void setRead(int Read) {
        this.Read = Read;
    }
    
    @Override
    public String toString() {
        return "Message{" + "MsgID=" + MsgID + ", Subject=" + Subject + ", Sender=" + Sender + ", Receiver=" + Receiver + ", pm=" + pm + '}';
    }

    public static int insertPM(String subject, int sender, int receiver, String pm, String time) {
        int row = 0;
        int newMemberID = 0;
        int read = 1;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(MSGID) AS LastMemberID FROM PM");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }
            PreparedStatement ps = con.prepareStatement("INSERT INTO PM VALUES (?,?,?,?,?,current_timestamp,?)");
            ps.setInt(1, newMemberID);
            ps.setString(2, subject);
            ps.setInt(3, sender);
            ps.setInt(4, receiver);
            ps.setString(5, pm);
            ps.setInt(6, read);

            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static List<Message> findReceiver(int str) {
        String sqlCmd = "SELECT * from Account a , PM m where m.sender = a.Account_Id AND m.Receiver = ? ";
        Connection con = ConnectionAgent.getConnection();

        Message c = null;
        List<Message> cs = new ArrayList<Message>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Message();
                rToO(c, rs);
                cs.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static List<Message> findSender(int str) {
        String sqlCmd = "SELECT * from Account a , PM m where m.sender = a.Account_Id AND m.sender = ? ";
        Connection con = ConnectionAgent.getConnection();
        Message c = null;
        List<Message> cs = new ArrayList<Message>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Message();
                rToO(c, rs);
                cs.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static Message findSender2(int str) {
        String sqlCmd = "SELECT * from Account a , PM m where m.sender = a.Account_Id AND m.msgid = ? ";
        Connection con = ConnectionAgent.getConnection();
        Message c = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, str);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new Message();
                rToO(c, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public static int deletePm(String pmid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM PM WHERE msgID=?");
            ps.setString(1, pmid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static int findCount(int str) {
        String sqlCmd = "SELECT count(*) FROM PM WHERE receiver = ? and isread = 1";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Message> cs = new ArrayList<Message>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str + "%");
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int updateRead(int msg) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE PM SET isread=0  WHERE msgID=?");
            ps.setInt(1, msg);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }

    private static void rToO(Message m, ResultSet rs) {
        try {
            m.setMsgID(rs.getInt("msgid"));
            m.setSubject(rs.getString("subject"));
            m.setSender(rs.getInt("sender"));
            m.setReceiver(rs.getInt("receiver"));
            m.setPm(rs.getString("pm"));
            m.setTime(rs.getString("time"));
            m.setUsername(rs.getString("username"));
            m.setRead(rs.getInt("isread"));
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
