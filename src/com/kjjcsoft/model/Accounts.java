/**
 * 
 */
package com.kjjcsoft.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.kjjcsoft.bean.AccountBean;
/**
 * @author Seekraw
 */
public class Accounts {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private ResultSet rsNext;
	private ResultSet thirdRs;
	public Accounts() {
		con = null;
		ps = null;
		rs = null;
	}
	public boolean createDsAccount(AccountBean newDsAc) {
		boolean accountCreated = false;
		Date dt = new Date();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("INSERT into tbl_daily_savings (customer_id, interest_rate, creation_date, approved_by, entry_by) VALUES (?,?,?,?,?)");
			ps.setInt(1, newDsAc.getCustomerId());
			ps.setFloat(2, newDsAc.getInterestRate());
			ps.setDate(3, DBFunctions.convertToSqlDate(dt));
			ps.setString(4, newDsAc.getApprovedBy());
			ps.setInt(5, newDsAc.getEntryBy());
			ps.executeUpdate();
			accountCreated = true;
		} catch (SQLException ex) {
			accountCreated = false;
			ex.printStackTrace();
		} finally {
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
	public AccountBean retLastDsAcCreated(int customer_id) {
		AccountBean retBean = new AccountBean();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT ds_id, customer_id, interest_rate from tbl_daily_savings WHERE customer_id=? ORDER BY ds_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				retBean.setAccountId(rs.getInt("ds_id"));
				retBean.setCustomerId(rs.getInt("customer_id"));
				retBean.setInterestRate(rs.getFloat("interest_rate"));
			} else {
				retBean.setAccountId(0);
			}
		} catch (SQLException ex) {
			retBean.setAccountId(0);
			ex.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return retBean;
	}
	public boolean createMsAccount(AccountBean newMsAc) {
		boolean accountCreated = false;
		Date dt = new Date();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("INSERT into tbl_monthly_savings (customer_id, interest_rate, creation_date, approved_by, entry_by) VALUES (?,?,?,?,?)");
			ps.setInt(1, newMsAc.getCustomerId());
			ps.setFloat(2, newMsAc.getInterestRate());
			ps.setDate(3, DBFunctions.convertToSqlDate(dt));
			ps.setString(4, newMsAc.getApprovedBy());
			ps.setInt(5, newMsAc.getEntryBy());
			ps.executeUpdate();
			accountCreated = true;
		} catch (SQLException ex) {
			accountCreated = false;
			ex.printStackTrace();
		} finally {
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
	public AccountBean retLastMsAcCreated(int customer_id) {
		AccountBean retBean = new AccountBean();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT ms_id, customer_id, interest_rate from tbl_monthly_savings WHERE customer_id=? ORDER BY ms_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				retBean.setAccountId(rs.getInt("ms_id"));
				retBean.setCustomerId(rs.getInt("customer_id"));
				retBean.setInterestRate(rs.getFloat("interest_rate"));
			} else {
				retBean.setAccountId(0);
			}
		} catch (SQLException ex) {
			retBean.setAccountId(0);
			ex.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return retBean;
	}
	public boolean createFdsAccount(AccountBean newFdsAc) {
		boolean accountCreated = false;
		Date dt = new Date();
		Calendar date = Calendar.getInstance();
		date.add(Calendar.YEAR, newFdsAc.getYears());
		Date mDt = date.getTime();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("INSERT INTO tbl_fixed_deposit (customer_id, interest_rate, fd_amount, maturity_date, creation_date, approved_by, entry_by) VALUES (?,?,?,?,?,?,?)");
			ps.setInt(1, newFdsAc.getCustomerId());
			ps.setFloat(2, newFdsAc.getInterestRate());
			ps.setDouble(3, newFdsAc.getFixedDepositAmount());
			ps.setDate(4, DBFunctions.convertToSqlDate(mDt));
			ps.setDate(5, DBFunctions.convertToSqlDate(dt));
			ps.setString(6, newFdsAc.getApprovedBy());
			ps.setInt(7, newFdsAc.getEntryBy());
			ps.executeUpdate();
			accountCreated = true;
		} catch (SQLException ex) {
			accountCreated = false;
			ex.printStackTrace();
		} finally {
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
	public AccountBean retLastFdsAcCreated(int customer_id) {
		AccountBean retBean = new AccountBean();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT fds_id, customer_id, interest_rate, fd_amount, maturity_date FROM tbl_fixed_deposit WHERE customer_id=? ORDER BY fds_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				retBean.setAccountId(rs.getInt("fds_id"));
				retBean.setCustomerId(rs.getInt("customer_id"));
				retBean.setInterestRate(rs.getFloat("interest_rate"));
				retBean.setFixedDepositAmount(rs.getDouble("fd_amount"));
				retBean.setMaturityPeriod(rs.getString("maturity_date"));
			} else {
				retBean.setAccountId(0);
			}
		} catch (SQLException ex) {
			retBean.setAccountId(0);
			ex.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return retBean;
	}
	public boolean createCfdAccount(AccountBean newCfdAc) {
		boolean accountCreated = false;
		Date dt = new Date();
		Calendar cd = Calendar.getInstance();
		cd.add(Calendar.YEAR, newCfdAc.getYears());
		Date mDt = cd.getTime();
		try {
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
		} catch (SQLException ex) {
			accountCreated = false;
			ex.printStackTrace();
		} finally {
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
	public AccountBean retLastCfdAcCreated(int customer_id) {
		AccountBean retBean = new AccountBean();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT cfd_id, customer_id, interest_rate, maturity_date FROM tbl_c_fixed_deposit WHERE customer_id=? ORDER BY cfd_id DESC LIMIT 1");
			ps.setInt(1, customer_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				retBean.setAccountId(rs.getInt("cfd_id"));
				retBean.setCustomerId(rs.getInt("customer_id"));
				retBean.setInterestRate(rs.getFloat("interest_rate"));
				retBean.setMaturityPeriod(rs.getString("maturity_date"));
			} else {
				retBean.setAccountId(0);
			}
		} catch (SQLException ex) {
			retBean.setAccountId(0);
			ex.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return retBean;
	}
	public int getCountDailySavings() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(ds_id) as count FROM tbl_daily_savings");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountActiveDailySavings() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(ds_id) as count FROM tbl_daily_savings WHERE ac_status = 1");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountInactiveDailySavings() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(ds_id) as count FROM tbl_daily_savings WHERE ac_status = 0");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountMonthlySavings() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(ms_id) as count FROM tbl_monthly_savings");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountActiveMonthlySavings() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(ms_id) as count FROM tbl_monthly_savings WHERE ac_status = 1");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountInactiveMonthlySavings() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(ms_id) as count FROM tbl_monthly_savings WHERE ac_status = 0");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountFixedDeposit() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(fds_id) as count FROM tbl_fixed_deposit");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountActiveFixedDeposit() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(fds_id) as count FROM tbl_fixed_deposit WHERE ac_status = 1");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountInactiveFixedDeposit() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(fds_id) as count FROM tbl_fixed_deposit WHERE ac_status = 0");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountContinuousFixedDeposit() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(cfd_id) as count FROM tbl_c_fixed_deposit");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountActiveContinuousFixedDeposit() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(cfd_id) as count FROM tbl_c_fixed_deposit WHERE ac_status = 1");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public int getCountInactiveContinuousFixedDeposit() {
		int count = 0;
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT COUNT(cfd_id) as count FROM tbl_c_fixed_deposit WHERE ac_status = 0");
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return count;
	}
	public ArrayList<AccountBean> getDailySavingAccounts() {
		boolean rsNextStatus = false;
		boolean thirdRsStatus = false;
		ArrayList<AccountBean> list = new ArrayList<AccountBean>();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT * FROM tbl_daily_savings");
			rs = ps.executeQuery();
			while (rs.next()) {
				AccountBean accountList = new AccountBean();
				accountList.setAccountId(rs.getInt("ds_id"));
				accountList.setCustomerId(rs.getInt("customer_id"));
				accountList.setInterestRate(rs.getFloat("interest_rate"));
				accountList.setCreationDate(rs.getString("creation_date"));
				accountList.setApprovedBy(rs.getString("approved_by"));
				accountList.setEntryBy(rs.getInt("entry_by"));
				accountList.setStatus(rs.getBoolean("ac_status"));
				rsNext = con.prepareStatement("SELECT customer_name FROM tbl_customer WHERE customer_id=" + accountList.getCustomerId()).executeQuery();
				if (rsNext.next()) {
					accountList.setCustomerName(rsNext.getString("customer_name"));
					rsNextStatus = true;
				}
				thirdRs = con.prepareStatement("SELECT username FROM tbl_user WHERE user_id =" + accountList.getEntryBy()).executeQuery();
				if (thirdRs.next()) {
					accountList.setEnteredby(thirdRs.getString("username"));
					thirdRsStatus = true;
				}
				list.add(accountList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rsNextStatus) {
				try {
					rsNext.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (thirdRsStatus) {
				try {
					thirdRs.next();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return list;
	}
	public ArrayList<AccountBean> getMonthlySavingAccounts() {
		boolean rsNextStatus = false;
		boolean thirdRsStatus = false;
		ArrayList<AccountBean> list = new ArrayList<AccountBean>();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT * FROM tbl_monthly_savings");
			rs = ps.executeQuery();
			while (rs.next()) {
				AccountBean accountList = new AccountBean();
				accountList.setAccountId(rs.getInt("ms_id"));
				accountList.setCustomerId(rs.getInt("customer_id"));
				accountList.setInterestRate(rs.getFloat("interest_rate"));
				accountList.setCreationDate(rs.getString("creation_date"));
				accountList.setApprovedBy(rs.getString("approved_by"));
				accountList.setEntryBy(rs.getInt("entry_by"));
				accountList.setStatus(rs.getBoolean("ac_status"));
				rsNext = con.prepareStatement("SELECT customer_name FROM tbl_customer WHERE customer_id=" + accountList.getCustomerId()).executeQuery();
				if (rsNext.next()) {
					accountList.setCustomerName(rsNext.getString("customer_name"));
					rsNextStatus = true;
				}
				thirdRs = con.prepareStatement("SELECT username FROM tbl_user WHERE user_id =" + accountList.getEntryBy()).executeQuery();
				if (thirdRs.next()) {
					accountList.setEnteredby(thirdRs.getString("username"));
					thirdRsStatus = true;
				}
				list.add(accountList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rsNextStatus) {
				try {
					rsNext.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (thirdRsStatus) {
				try {
					thirdRs.next();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return list;
	}
	public ArrayList<AccountBean> getFixedDepositAccounts() {
		boolean rsNextStatus = false;
		boolean thirdRsStatus = false;
		ArrayList<AccountBean> list = new ArrayList<AccountBean>();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT * FROM tbl_fixed_deposit");
			rs = ps.executeQuery();
			while (rs.next()) {
				AccountBean accountList = new AccountBean();
				accountList.setAccountId(rs.getInt("fds_id"));
				accountList.setCustomerId(rs.getInt("customer_id"));
				accountList.setInterestRate(rs.getFloat("interest_rate"));
				accountList.setFixedDepositAmount(rs.getDouble("fd_amount"));
				accountList.setMaturityPeriod(rs.getString("maturity_date"));
				accountList.setCreationDate(rs.getString("creation_date"));
				accountList.setApprovedBy(rs.getString("approved_by"));
				accountList.setEntryBy(rs.getInt("entry_by"));
				accountList.setStatus(rs.getBoolean("ac_status"));
				rsNext = con.prepareStatement("SELECT customer_name FROM tbl_customer WHERE customer_id=" + accountList.getCustomerId()).executeQuery();
				if (rsNext.next()) {
					accountList.setCustomerName(rsNext.getString("customer_name"));
					rsNextStatus = true;
				}
				thirdRs = con.prepareStatement("SELECT username FROM tbl_user WHERE user_id =" + accountList.getEntryBy()).executeQuery();
				if (thirdRs.next()) {
					accountList.setEnteredby(thirdRs.getString("username"));
					thirdRsStatus = true;
				}
				list.add(accountList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rsNextStatus) {
				try {
					rsNext.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (thirdRsStatus) {
				try {
					thirdRs.next();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return list;
	}
	public ArrayList<AccountBean> getCFixedDepositAccounts() {
		boolean rsNextStatus = false;
		boolean thirdRsStatus = false;
		ArrayList<AccountBean> list = new ArrayList<AccountBean>();
		try {
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT * FROM tbl_c_fixed_deposit");
			rs = ps.executeQuery();
			while (rs.next()) {
				AccountBean accountList = new AccountBean();
				accountList.setAccountId(rs.getInt("cfd_id"));
				accountList.setCustomerId(rs.getInt("customer_id"));
				accountList.setInterestRate(rs.getFloat("interest_rate"));
				accountList.setMaturityPeriod(rs.getString("maturity_date"));
				accountList.setCreationDate(rs.getString("creation_date"));
				accountList.setApprovedBy(rs.getString("approved_by"));
				accountList.setEntryBy(rs.getInt("entry_by"));
				accountList.setStatus(rs.getBoolean("ac_status"));
				rsNext = con.prepareStatement("SELECT customer_name FROM tbl_customer WHERE customer_id=" + accountList.getCustomerId()).executeQuery();
				if (rsNext.next()) {
					accountList.setCustomerName(rsNext.getString("customer_name"));
					rsNextStatus = true;
				}
				thirdRs = con.prepareStatement("SELECT username FROM tbl_user WHERE user_id =" + accountList.getEntryBy()).executeQuery();
				if (thirdRs.next()) {
					accountList.setEnteredby(thirdRs.getString("username"));
					thirdRsStatus = true;
				}
				list.add(accountList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rsNextStatus) {
				try {
					rsNext.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (thirdRsStatus) {
				try {
					thirdRs.next();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		return list;
	}
}
