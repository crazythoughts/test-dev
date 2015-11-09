package com.kjjcsoft.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.kjjcsoft.bean.AccountBean;
import com.kjjcsoft.bean.LoanAccountBean;


public class LoanAccounts {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public LoanAccounts(){
		con = null;
		ps = null;
		rs = null;
	}
	public boolean createAlAccount(LoanAccountBean newDsAc){
		boolean accountCreated = false;
		Date cdt= new Date();
		Date rdt=new Date();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("INSERT into tbl_agr_loan (customer_id, interest_rate, approved_by, approved_amount,date_of_investment,date_of_return) VALUES (?,?,?,?,?,?)");
			ps.setInt(1, newDsAc.getCustomerId());
			ps.setFloat(2, newDsAc.getInterestRate());
			ps.setString(3, newDsAc.getApprovedBy());
			ps.setString(4, newDsAc.getApprovedAmount());
			ps.setDate(5, DBFunctions.convertToSqlDate(cdt));
			ps.setDate(6, DBFunctions.convertToSqlDate(rdt));
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
	public AccountBean retLastAlAcCreated(int customer_id){
		AccountBean retBean = new AccountBean();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("SELECT al_id, customer_id, interest_rate from tbl_agr_loan WHERE customer_id=? ORDER BY ds_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			if (rs.next()) {
				retBean.setAccountId(rs.getInt("al_id"));
			} else {
				retBean.setAccountId(0);
			}
		} catch (SQLException ex){
			retBean.setAccountId(0);
			ex.printStackTrace();
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
		return retBean;
	}
	public boolean createBlAccount(LoanAccountBean newDsAc){
		boolean accountCreated = false;
		Date dt= new Date();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("INSERT into tbl_bus_loan (customer_id, interest_rate, creation_date, approved_by, entry_by) VALUES (?,?,?,?,?)");
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
	public AccountBean retLastBlAcCreated(int customer_id){
		AccountBean retBean = new AccountBean();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("SELECT bl_id, customer_id, interest_rate from tbl_daily_savings WHERE customer_id=? ORDER BY ds_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			if (rs.next()) {
				retBean.setAccountId(rs.getInt("bl_id"));
			} else {
				retBean.setAccountId(0);
			}
		} catch (SQLException ex){
			retBean.setAccountId(0);
			ex.printStackTrace();
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
		return retBean;
	}

}
