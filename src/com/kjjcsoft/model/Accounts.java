/**
 * 
 */
package com.kjjcsoft.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.kjjcsoft.bean.AccountBean;

/**
 * @author Seekraw
 *
 */
public class Accounts {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public Accounts(){
		con = null;
		ps = null;
		rs = null;
	}
	public boolean createDsAccount(AccountBean newDsAc){
		boolean accountCreated = false;
		Date dt= new Date();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("INSERT into tbl_daily_savings (customer_id, interest_rate, creation_date, approved_by, entry_by) VALUES (?,?,?,?,?)");
			ps.setInt(1, newDsAc.getCustomerId());
			ps.setFloat(2, newDsAc.getInterestRate());
			ps.setDate(3, DBFunctions.convertToSqlDate(dt));
			ps.setString(4, newDsAc.getApprovedBy());
			ps.setInt(5, newDsAc.getEntryBy());
			ps.executeUpdate();
			accountCreated = true;
		}catch(SQLException ex){
			accountCreated=false;
			ex.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return accountCreated;
	}
	public int retLastDsAcCreated(int customer_id){
		int dsAccountNumber=0;
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("SELECT ds_id from tbl_daily_savings WHERE customer_id=? ORDER BY ds_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			if (rs.next()) {
				dsAccountNumber=rs.getInt("ds_id");
			} else {
				dsAccountNumber=0;
			}
		} catch (SQLException ex){
			ex.getStackTrace();
		}
		 finally {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		return dsAccountNumber;
	}
	public boolean createMsAccount(AccountBean newMsAc){
		boolean accountCreated = false;
		Date dt= new Date();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("INSERT into tbl_monthly_savings (customer_id, interest_rate, creation_date, approved_by, entry_by) VALUES (?,?,?,?,?)");
			ps.setInt(1, newMsAc.getCustomerId());
			ps.setFloat(2, newMsAc.getInterestRate());
			ps.setDate(3, DBFunctions.convertToSqlDate(dt));
			ps.setString(4, newMsAc.getApprovedBy());
			ps.setInt(5, newMsAc.getEntryBy());
			ps.executeUpdate();
			accountCreated = true;
		}catch(SQLException ex){
			accountCreated=false;
			ex.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return accountCreated;
	}
	public int retLastMsAcCreated(int customer_id){
		int msAccountNumber=0;
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("SELECT ms_id from tbl_monthly_savings WHERE customer_id=? ORDER BY ms_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			if (rs.next()) {
				msAccountNumber=rs.getInt("ms_id");
			} else {
				msAccountNumber=0;
			}
		} catch (SQLException ex){
			ex.getStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return msAccountNumber;
	}
}
