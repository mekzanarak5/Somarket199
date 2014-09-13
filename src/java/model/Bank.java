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
public class Bank {
    private int Bank_Id;
    private int AcctId;
    private String BankName;
    private String BankAccNo;
    private String BankAccName;

    public Bank() {
    }

    public Bank(int Bank_Id, int AcctId, String BankName, String BankAccNo, String BankAccName) {
        this.Bank_Id = Bank_Id;
        this.AcctId = AcctId;
        this.BankName = BankName;
        this.BankAccNo = BankAccNo;
        this.BankAccName = BankAccName;
    }

    public int getBank_Id() {
        return Bank_Id;
    }

    public void setBank_Id(int Bank_Id) {
        this.Bank_Id = Bank_Id;
    }

    public int getAcctId() {
        return AcctId;
    }

    public void setAcctId(int AcctId) {
        this.AcctId = AcctId;
    }

    public String getBankName() {
        return BankName;
    }

    public void setBankName(String BankName) {
        this.BankName = BankName;
    }

    public String getBankAccNo() {
        return BankAccNo;
    }

    public void setBankAccNo(String BankAccNo) {
        this.BankAccNo = BankAccNo;
    }

    public String getBankAccName() {
        return BankAccName;
    }

    public void setBankAccName(String BankAccName) {
        this.BankAccName = BankAccName;
    }
              
    public static int addBank(int AcctNo, String BankName, String BankAccNo, String BankAccName) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(bank_ID) AS LastMemberID FROM bankaccount");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO bankaccount VALUES (?,?,?,?,?)");
            ps.setInt(1, newMemberID);
            ps.setInt(2, AcctNo);
            ps.setString(3, BankName);
            ps.setString(4, BankAccNo);
            ps.setString(5, BankAccName);

            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static int editBank(String BankName, String BankAccNo, String BankAccName,int Address_Id) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE BANKACCOUNT SET BankName=?,BankAccNo=?,BankAccName=? WHERE BANK_Id=?");
            ps.setString(1, BankName);
            ps.setString(2, BankAccNo);
            ps.setString(3, BankAccName);
            ps.setInt(4, Address_Id);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            row = -1;
        }
        return row;
    }
    public static List<Bank> showBank(int id) {
        String sqlCmd = "SELECT * FROM BANKACCOUNT WHERE AcctNo = ?";
        Connection con = ConnectionAgent.getConnection();
        Bank a = null;
        List<Bank> pa = new ArrayList<Bank>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = new Bank();
                rToO(a, rs);
                pa.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bank.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pa;
    }
    public static int lastid() {
        Connection con = ConnectionAgent.getConnection();
        int id = 0;
        try {
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(BANK_ID) FROM BANKACCOUNT");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    private static void rToO(Bank a, ResultSet rs) {
        try {
            a.setBank_Id(rs.getInt("Bank_Id"));
            a.setAcctId(rs.getInt("AcctNo"));
            a.setBankName(rs.getString("BankName"));
            a.setBankAccNo(rs.getString("BankAccNo"));
            a.setBankAccName(rs.getString("BankAccName"));

        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
