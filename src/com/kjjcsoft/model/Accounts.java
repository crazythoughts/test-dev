/**
 * 
 */
package com.kjjcsoft.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
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
	public AccountBean retLastDsAcCreated(int customer_id){
		AccountBean retBean = new AccountBean();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("SELECT ds_id, customer_id, interest_rate from tbl_daily_savings WHERE customer_id=? ORDER BY ds_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			if (rs.next()) {
				retBean.setAccountId(rs.getInt("ds_id"));
				retBean.setCustomerId(rs.getInt("customer_id"));
				retBean.setInterestRate(rs.getFloat("interest_rate"));
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
	public AccountBean retLastMsAcCreated(int customer_id){
		AccountBean retBean = new AccountBean();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("SELECT ms_id, customer_id, interest_rate from tbl_monthly_savings WHERE customer_id=? ORDER BY ms_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			if (rs.next()) {
				retBean.setAccountId(rs.getInt("ms_id"));
				retBean.setCustomerId(rs.getInt("customer_id"));
				retBean.setInterestRate(rs.getFloat("interest_rate"));
			} else {
				retBean.setAccountId(0);
			}
		} catch (SQLException ex){
			retBean.setAccountId(0);
			ex.printStackTrace();
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
		return retBean;
	}
	public boolean createFdsAccount(AccountBean newFdsAc){
		boolean accountCreated=false;
		Date dt= new Date();
		Calendar date = Calendar.getInstance();
		date.add(Calendar.YEAR, newFdsAc.getYears());
		Date mDt=date.getTime();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("INSERT INTO tbl_fixed_deposit (customer_id, interest_rate, fd_amount, maturity_date, creation_date, approved_by, entry_by) VALUES (?,?,?,?,?,?,?)");
			ps.setInt(1, newFdsAc.getCustomerId());
			ps.setFloat(2, newFdsAc.getInterestRate());
			ps.setDouble(3, newFdsAc.getFixedDepositAmount());
			ps.setDate(4, DBFunctions.convertToSqlDate(mDt));
			ps.setDate(5, DBFunctions.convertToSqlDate(dt));
			ps.setString(6, newFdsAc.getApprovedBy());
			ps.setInt(7, newFdsAc.getEntryBy());
			ps.executeUpdate();
			accountCreated=true;
		} catch(SQLException ex) {
			accountCreated=false;
			ex.printStackTrace();
		} finally {
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
		return accountCreated;
	}
	public AccountBean retLastFdsAcCreated(int customer_id){
		AccountBean retBean= new AccountBean();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("SELECT fds_id, customer_id, interest_rate, fd_amount, maturity_date FROM tbl_fixed_deposit WHERE customer_id=? ORDER BY fds_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			if (rs.next()) {
				retBean.setAccountId(rs.getInt("fds_id"));
				retBean.setCustomerId(rs.getInt("customer_id"));
				retBean.setInterestRate(rs.getFloat("interest_rate"));
				retBean.setFixedDepositAmount(rs.getDouble("fd_amount"));
				retBean.setMaturityPeriod(rs.getDate("maturity_date"));
			} else {
				retBean.setAccountId(0);
			}
		} catch (SQLException ex){
			retBean.setAccountId(0);
			ex.printStackTrace();
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
		return retBean;
	}
	public boolean createCfdAccount(AccountBean newCfdAc){
		boolean accountCreated = false;
		Date dt= new Date();
		Calendar cd = Calendar.getInstance();
		cd.add(Calendar.YEAR, newCfdAc.getYears());
		Date mDt = cd.getTime();
		try{
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("INSERT INTO tbl_c_fixed_deposit (customer_id, interest_rate, maturity_date, creation_date, approved_by, entry_by) VALUES (?,?,?,?,?,?)");
			ps.setInt(1, newCfdAc.getCustomerId());
			ps.setFloat(2, newCfdAc.getInterestRate());
			ps.setDate(3, DBFunctions.convertToSqlDate(mDt));
			ps.setDate(4, DBFunctions.convertToSqlDate(dt));
			ps.setString(5, newCfdAc.getApprovedBy());
			ps.setInt(6, newCfdAc.getEntryBy());
			ps.executeUpdate();
			accountCreated = true;
		} catch (SQLException ex){
			accountCreated = false;
			ex.printStackTrace();
		} finally {
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
		return accountCreated;
	}
	public AccountBean retLastCfdAcCreated(int customer_id){
		AccountBean retBean = new AccountBean();
		try{
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT cfd_id, customer_id, interest_rate, maturity_date FROM tbl_c_fixed_deposit WHERE customer_id=? ORDER BY cfd_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				retBean.setAccountId(rs.getInt("cfd_id"));
				retBean.setCustomerId(rs.getInt("customer_id"));
				retBean.setInterestRate(rs.getFloat("interest_rate"));
				retBean.setMaturityPeriod(rs.getDate("maturity_date"));
			} else {
				retBean.setAccountId(0);
			}
		} catch (SQLException ex){
			retBean.setAccountId(0);
			ex.printStackTrace();
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
		return retBean;
	}
}
