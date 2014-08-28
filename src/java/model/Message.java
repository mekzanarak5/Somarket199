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
    private int Receiever;
    private String pm;
    private String time;

    public Message(int MsgID, String Subject, int Sender, int Receiever, String pm, String time) {
        this.MsgID = MsgID;
        this.Subject = Subject;
        this.Sender = Sender;
        this.Receiever = Receiever;
        this.pm = pm;
        this.time = time;
    }

    private Message() {
        
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

    public int getReceiever() {
        return Receiever;
    }

    public void setReceiever(int Receiever) {
        this.Receiever = Receiever;
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

    
    
    @Override
    public String toString() {
        return "Message{" + "MsgID=" + MsgID + ", Subject=" + Subject + ", Sender=" + Sender + ", Receiever=" + Receiever + ", pm=" + pm + '}';
    }
    
    public static int insertPM(String subject, int sender, int receiver,String pm,String time) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(MSGID) AS LastMemberID FROM MESSAGE");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }
            PreparedStatement ps = con.prepareStatement("INSERT INTO MESSAGE VALUES (?,?,?,?,?,current_timestamp)");
            ps.setInt(1, newMemberID);
            ps.setString(2, subject);
            ps.setInt(3, sender);
            ps.setInt(4, receiver);
            ps.setString(5, pm);
           
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
     public static List<Message> find(String str) {
        String sqlCmd = "SELECT * FROM Message WHERE Receiever like ?";
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
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    private static void rToO(Message m, ResultSet rs) {
        try {
            m.setMsgID(rs.getInt("msgid"));
            m.setSubject(rs.getString("subject"));
            m.setSender(rs.getInt("sender"));
            m.setReceiever(rs.getInt("receiever"));
            m.setPm(rs.getString("pm"));
            m.setTime(rs.getString("time"));
            
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
