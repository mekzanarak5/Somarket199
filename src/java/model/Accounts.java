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

    private int Account_Id;
    private String Username;
    private String Password;
    private String Email;
    private String FirstName;
    private String LastName;
    private String Phone;
    private String Created;
    private String Pic;

    public Accounts() {
    }

    public Accounts(int Account_Id, String Username, String Password, String Email, String FirstName, String LastName, String Phone, String Created, String Pic) {
        this.Account_Id = Account_Id;
        this.Username = Username;
        this.Password = Password;
        this.Email = Email;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Phone = Phone;
        this.Created = Created;
        this.Pic = Pic;
    }

    public int getAccount_Id() {
        return Account_Id;
    }

    public void setAccount_Id(int Account_Id) {
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

    public String getPic() {
        return Pic;
    }

    public void setPic(String Pic) {
        this.Pic = Pic;
    }

    public static int addAccount(String Username, String Password, String Email, String FirstName, String LastName, String Phone) {
        int row = 0;
        int newMemberID = 0;
        try {
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(Account_Id) AS LastMemberID FROM account");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO account(Account_Id, Username, Password, Email, FirstName, LastName, Phone, Created) VALUES (?,?,?,?,?,?,?,current_timestamp)");
            ps.setInt(1, newMemberID);
            ps.setString(2, Username);
            ps.setString(3, Password);
            ps.setString(4, Email);
            ps.setString(5, FirstName);
            ps.setString(6, LastName);
            ps.setString(7, Phone);
            row = ps.executeUpdate();
            con.close();
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
        String sqlCmd = "SELECT * FROM account WHERE Username = ?";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public static List<Accounts> findByIdSender(int id) {
        String sqlCmd = "SELECT * FROM account WHERE Account_Id = ?";
        Connection con = ConnectionAgent.getConnection();
        Accounts a = null;
        List<Accounts> cs = new ArrayList<Accounts>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = new Accounts();
                rToO(a, rs);
                cs.add(a);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static List<Accounts> findAllAcct() {
        String sqlCmd = "SELECT * FROM account";
        Connection con = ConnectionAgent.getConnection();
        Accounts a = null;
        List<Accounts> cs = new ArrayList<Accounts>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = new Accounts();
                rToO(a, rs);
                cs.add(a);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static Accounts findById2(int id) {
        String sqlCmd = "SELECT * FROM account WHERE Account_Id = ?";
        Connection con = ConnectionAgent.getConnection();
        Accounts a = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Accounts();
                rToO(a, rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public static Accounts findById3(String id) {
        String sqlCmd = "SELECT * FROM account WHERE Account_Id = ?";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public static Accounts getUser(String user) {
        String sql = "select * from account where username= ?";
        PreparedStatement ps;
        Accounts m = null;
        try {
            ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                m = new Accounts();
                rToO(m, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }

    public static Accounts findPic(int id) {
        String sqlCmd = "SELECT Pic FROM account WHERE Account_Id = ?";
        Connection con = ConnectionAgent.getConnection();
        Accounts a = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Accounts();
                rToO(a, rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public static int editProfile(String firstname, String lastname, String phone, int acctid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE account SET FirstName=?,LastName=?,Phone=?  WHERE Account_Id=?");
            //ps.setString(1, dispname);
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, phone);
            ps.setInt(4, acctid);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }

    public static int changePassword(String password, int acctid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE account SET Password=? WHERE Account_Id=?");
            ps.setString(1, password);
            ps.setInt(2, acctid);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }

    private static void rToO(Accounts a, ResultSet rs) {
        try {
            a.setAccount_Id(rs.getInt("Account_Id"));
            a.setUsername(rs.getString("Username"));
            a.setPassword(rs.getString("Password"));
            a.setEmail(rs.getString("Email"));
            a.setFirstName(rs.getString("FirstName"));
            a.setLastName(rs.getString("LastName"));
            a.setPhone(rs.getString("Phone"));
            a.setCreated(rs.getString("Created"));
            a.setPic(rs.getString("Pic"));
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static int checkDuplicatedUser(String Username) {
        int count = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS Count FROM account WHERE Username = ?");
            ps.setString(1, Username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            } else {
                count = 0;
            }
            con.close();
        } catch (SQLException ex) {
            return 999;
        }
        return count;
    }

    public static int addPic(String accountid, String pic) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            System.out.println(pic);
            PreparedStatement ps = con.prepareStatement("UPDATE account SET Pic = ? WHERE Account_Id=?");
            ps.setString(1, pic);
            ps.setString(2, accountid);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public boolean login(String username, String password) {
        String sql = "select Password from account where Username = ?";
        String pass = "";
        try {
            PreparedStatement ps = ConnectionAgent.getConnection().prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pass = rs.getString("Password");
            }
            ConnectionAgent.getConnection().close();
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
        String sqlCmd = "SELECT * FROM account WHERE Username like ? ORDER BY Account_Id ASC";
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
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public static int deleteAccount(String accountid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM account WHERE Account_Id=?");
            ps.setString(1, accountid);
            row = ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static Accounts getAccountById(int str) {
        String sqlCmd = "SELECT * from account a where a.Account_Id = ? ";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        Accounts cs = new Accounts();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cs.setAccount_Id(rs.getInt("Account_Id"));
                cs.setUsername(rs.getString("Username"));
                cs.setEmail(rs.getString("Email"));
                cs.setFirstName(rs.getString("FirstName"));
                cs.setLastName(rs.getString("LastName"));
                cs.setPhone(rs.getString("Phone"));
                cs.setCreated(rs.getString("Created"));
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
}