/**
 * 
 */
package com.kjjcsoft.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kjjcsoft.bean.UserLogBean;

/**
 * @author Seekraw
 *
 */
public class Users {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public ArrayList<UserLogBean> getMyLogs(int userId){
		ArrayList<UserLogBean> list = new ArrayList<UserLogBean>();
		try{
			con = ConnectionProvider.getConnection();
			ps = con.prepareStatement("SELECT last_login, last_logout FROM tbl_user_log WHERE user_id=? ORDER BY log_id DESC");
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserLogBean logData = new UserLogBean();
				String loginTimeStamp = rs.getString("last_login");
				logData.setLoginTime(loginTimeStamp.substring(0, loginTimeStamp.indexOf(".")));
				String logoutTimeStamp = rs.getString("last_logout");
				if (logoutTimeStamp == null) {
					logData.setLogoutTime("current session");
				} else {
					logData.setLogoutTime(logoutTimeStamp.substring(0, logoutTimeStamp.indexOf(".")));
				}
				list.add(logData);
			}
		} catch (SQLException ex){
			ex.printStackTrace();
		}
		finally{
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
		return list;
	}
}
