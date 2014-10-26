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
    private int SenderID;
    private int ReceiverID;
    private String pm;
    private String time;
    private String username;
    private int Read;
    private String pic;
    private int relate;
    private String SenderName;
    private String ReceiverName;
    private int count;
    

    public Message() {
    }

    public Message(int MsgID, String Subject, int SenderID, int ReceiverID, String pm, String time, String username, int Read, String pic, int relate, String SenderName, String ReceiverName, int count) {
        this.MsgID = MsgID;
        this.Subject = Subject;
        this.SenderID = SenderID;
        this.ReceiverID = ReceiverID;
        this.pm = pm;
        this.time = time;
        this.username = username;
        this.Read = Read;
        this.pic = pic;
        this.relate = relate;
        this.SenderName = SenderName;
        this.ReceiverName = ReceiverName;
        this.count = count;
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

    public int getSenderID() {
        return SenderID;
    }

    public void setSenderID(int SenderID) {
        this.SenderID = SenderID;
    }

    public int getReceiverID() {
        return ReceiverID;
    }

    public void setReceiverID(int ReceiverID) {
        this.ReceiverID = ReceiverID;
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

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getRelate() {
        return relate;
    }

    public void setRelate(int relate) {
        this.relate = relate;
    }

    public String getSenderName() {
        return SenderName;
    }

    public void setSenderName(String SenderName) {
        this.SenderName = SenderName;
    }

    public String getReceiverName() {
        return ReceiverName;
    }

    public void setReceiverName(String ReceiverName) {
        this.ReceiverName = ReceiverName;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Message{" + "MsgID=" + MsgID + ", Subject=" + Subject + ", SenderID=" + SenderID + ", ReceiverID=" + ReceiverID + ", pm=" + pm + ", time=" + time + ", username=" + username + ", Read=" + Read + ", pic=" + pic + ", relate=" + relate + ", SenderName=" + SenderName + ", ReceiverName=" + ReceiverName + ", count=" + count + '}';
    }
     
    public static int insertPM(String subject, int senderID, int receiverID,String senderName,String receiverName, String pm, String time) {
        int row = 0;
        int newMemberID = 0;
        int read = 1;
        int count = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(MsgID) AS LastMemberID FROM Pm");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }
            PreparedStatement ps = con.prepareStatement("INSERT INTO Pm VALUES (?,?,?,?,?,?,?,current_timestamp,?,?,?)");
            ps.setInt(1, newMemberID);
            ps.setString(2, subject);
            ps.setInt(3, senderID);
            ps.setInt(4, receiverID);
            ps.setString(5, senderName);
            ps.setString(6, receiverName);
            ps.setString(7, pm);
            ps.setInt(8, read);
            ps.setInt(9, newMemberID);
            ps.setInt(10, count);

            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static int insertReply(String subject, int senderID, int receiverID,String senderName,String receiverName, String pm, String time,int relate) {
        int row = 0;
        int newMemberID = 0;
        double newMemberID1 = 0;
        int read = 1;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(MsgID) AS LastMemberID FROM Pm");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }
            PreparedStatement ps2 = con.prepareStatement("SELECT MAX(count) AS LastMember FROM Pm");
            ResultSet rs1 = ps2.executeQuery();
            if (rs1.next()) {
                newMemberID1 = rs1.getDouble(1) + 1;
            } else {
                newMemberID1 = 0;
            }
            PreparedStatement ps = con.prepareStatement("INSERT INTO Pm VALUES (?,?,?,?,?,?,?,current_timestamp,?,?,?)");
            ps.setInt(1, newMemberID);
            ps.setString(2, subject);
            ps.setInt(3, senderID);
            ps.setInt(4, receiverID);
            ps.setString(5, senderName);
            ps.setString(6, receiverName);
            ps.setString(7, pm);
            ps.setInt(8, read);
            ps.setInt(9, relate);
            ps.setDouble(10, newMemberID1);

            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static List<Message> findReceiver(String str) {
        String sqlCmd = "SELECT * from Pm where ReceiverID = ? ";
        Connection con = ConnectionAgent.getConnection();
        Message c = null;
        List<Message> cs = new ArrayList<Message>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Message();
                rToO(c, rs);
                cs.add(c);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static List<Message> findReceiverAd() {
        String sqlCmd = "SELECT * from Pm where ReceiverID = 0 ";
        Connection con = ConnectionAgent.getConnection();
        Message c = null;
        List<Message> cs = new ArrayList<Message>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Message();
                rToO(c, rs);
                cs.add(c);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static List<Message> findSender(int str) {
        String sqlCmd = "SELECT * from Pm where SenderID = ? and ReceiverID != 0";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static Message findSender2(int str) {
        String sqlCmd = "SELECT * from Pm where MsgID = ? ";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
    public static Message findCountMessage(int str) {
        String sqlCmd = "SELECT * from Pm where MsgID = ? ";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
    public static List<Message> findReply(int str) {
        String sqlCmd = "SELECT * from Pm where relateID = ? ORDER BY Time ASC";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static int deletePm(String pmid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE pm SET ReceiverID=null WHERE MsgID=?");
            ps.setString(1, pmid);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static int upPm(String pmid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE Pm SET SenderID=null  WHERE MsgID=?");
            ps.setString(1, pmid);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static int findCount(int str) {
        String sqlCmd = "SELECT count(*) FROM Pm WHERE ReceiverID = ? and isread = 1";
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
            PreparedStatement ps = con.prepareStatement("UPDATE Pm SET isread=0  WHERE MsgID=?");
            ps.setInt(1, msg);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }

    private static void rToO(Message m, ResultSet rs) {
        try {
            m.setMsgID(rs.getInt("MsgID"));
            m.setSubject(rs.getString("Subject"));
            m.setSenderID(rs.getInt("SenderID"));
            m.setSenderName(rs.getString("SenderName"));
            m.setReceiverID(rs.getInt("ReceiverID"));
            m.setReceiverName(rs.getString("ReceiverName"));
            m.setPm(rs.getString("PM"));
            m.setTime(rs.getString("Time"));
            m.setRead(rs.getInt("isread"));
            m.setRelate(rs.getInt("relateID"));
            m.setCount(rs.getInt("count"));
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
