/**
 * 
 */
package com.kjjcsoft.model;
import java.sql.*;
import com.kjjcsoft.bean.RetrivedUserBean;
import com.kjjcsoft.bean.UserBean;
/**
 * @author Seekraw
 *
 */
public class DBFunctions {
	private Connection con= null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private RetrivedUserBean user_info= new RetrivedUserBean();
	public RetrivedUserBean getUserInfo(UserBean u){
		try {
			con=ConnectionProvider.getConnection();
			ps= con.prepareStatement("SELECT u.user_id, u.username, u.role, u.employee_id, u.user_enabled, e.employee_name from tbl_user u, tbl_employee e WHERE u.employee_id=e.employee_id AND u.username=?");
			ps.setString(1, u.getUsername());
			rs=ps.executeQuery();
		} catch (Exception e) {
			System.out.println(e);
		}
		try{
			while(rs.next()){
				user_info.setUser_id(rs.getInt("user_id"));
				user_info.setUser_name(rs.getString("username"));
				user_info.setRole(rs.getString("role"));
				user_info.setEmployee_id(rs.getInt("employee_id"));
				user_info.setName(rs.getString("employee_name"));
			}
		}
		catch(SQLException ex){
			System.out.println(ex);
		}
		finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user_info;
	}
}
