/*
 * To change this template, choose Tools | Templates
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
public class Accounts {

    private String Account_Id;
    private String Username;
    private String Password;
    private String Email;
    private String dispName;
    private String FirstName;
    private String LastName;
    private String Phone;
    private String Created;

    public String getAccount_Id() {
        return Account_Id;
    }

    public void setAccount_Id(String Account_Id) {
        this.Account_Id = Account_Id;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getDispName() {
        return dispName;
    }

    public void setDispName(String dispName) {
        this.dispName = dispName;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getCreated() {
        return Created;
    }

    public void setCreated(String Created) {
        this.Created = Created;
    }

    @Override
    public String toString() {
        return "Accounts{" + "Account_Id=" + Account_Id + ", Username=" + Username + ", Password=" + Password + ", Email=" + Email + ", dispName=" + dispName + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Phone=" + Phone + ", Created=" + Created + '}';
    }

    public static int addAccount(String Username, String Password, String Email,String dispName,
            String FirstName,String LastName,String Phone,String Created) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(ACCOUNT_ID) AS LastMemberID FROM ACCOUNT");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO ACCOUNT VALUES (?,?,?,?,?,?,?,?,current_timestamp)");
            ps.setInt(1, newMemberID);
            ps.setString(2, Username);
            ps.setString(3, Password);
            ps.setString(4, Email);
            ps.setString(5, dispName);
            ps.setString(6, FirstName);
            ps.setString(7, LastName);
            ps.setString(8, Phone);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static boolean checkEmail(String email) {
        if (email.contains(" ") == false && email.matches(".+@.+\\.[a-z]+")) {
            return true;
        } else {
            return false;
        }
    }

    public static Accounts findById(String id) {
        String sqlCmd = "SELECT * FROM ACCOUNT WHERE USERNAME = ?";
        Connection con = ConnectionAgent.getConnection();
        Accounts a = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Accounts();
                rToO(a, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    public static Accounts findById2(String id) {
        String sqlCmd = "SELECT * FROM ACCOUNT WHERE account_ID = ?";
        Connection con = ConnectionAgent.getConnection();
        Accounts a = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Accounts();
                rToO(a, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    private static void rToO(Accounts a, ResultSet rs) {
        try {
            a.setAccount_Id(rs.getString("ACCOUNT_ID"));
            a.setUsername(rs.getString("USERNAME"));
            a.setPassword(rs.getString("PASSWORD"));
            a.setEmail(rs.getString("EMAIL"));
            a.setDispName(rs.getString("DISPNAME"));
            a.setFirstName(rs.getString("FIRSTNAME"));
            a.setLastName(rs.getString("LASTNAME"));
            a.setPhone(rs.getString("PHONE"));
            a.setCreated(rs.getString("CREATED"));
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    public static int checkDuplicatedUser(String Username) { 
        int count = 0; 
        try { 
  
            Connection con = ConnectionAgent.getConnection(); 
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS Count FROM ACCOUNT WHERE USERNAME = ?"); 
            ps.setString(1, Username); 
            ResultSet rs = ps.executeQuery(); 
            if (rs.next()) { 
                count = rs.getInt(1); 
            } else { 
                count = 0; 
            } 
  
        } catch (SQLException ex) { 
            return 999; 
        } 
        return count; 
    } 
    public static int editProfile(String password,String email,String firstname,String lastname,String userid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE ACCOUNT SET PASSWORD=?,EMAIL=?,FIRSTNAME=?,LASTNAME=?  WHERE USER_ID=?");
            ps.setString(1, password);
            ps.setString(2, email);
            ps.setString(3, firstname);
            ps.setString(4, lastname);
            ps.setString(5, userid);
            
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
            row=-1;
        }
        return row;
    }
    public static int addPic(String accountid ,String pic) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            System.out.println(pic);
            PreparedStatement ps = con.prepareStatement("UPDATE ACCOUNT SET PIC = ? WHERE ACCOUNT_ID=?");
            ps.setString(1, pic);
            ps.setString(2, accountid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    
    public boolean login(String username, String password) {
        String sql = "select password from account where username = ?";
        String pass = "";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pass = rs.getString("password");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (password.equals(pass)) {
            return true;
        } else {
            return false;
        }
    }
    
    public static List<Accounts> find(String str) {
        String sqlCmd = "SELECT * FROM ACCOUNT WHERE user_id like ? ORDER BY ACCOUNT_ID ASC";
        Connection con = ConnectionAgent.getConnection();
        Accounts a = null;
        List<Accounts> cs = new ArrayList<Accounts>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = new Accounts();
                rToO(a, rs);
                cs.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static int deleteAccount(String accountid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM ACCOUNT WHERE ACCOUNT_ID=?");
            ps.setString(1, accountid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
}
