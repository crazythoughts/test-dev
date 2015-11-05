/**
 * 
 */
package com.kjjcsoft.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

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
	public boolean createDsAccount(int id, float interest, int entryBy){
		boolean accountCreated = false;
		Date dt= new Date();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("INSERT into tbl_daily_savings (customer_id, interest_rate, creation_date, entry_by) VALUES (?,?,?,?)");
			ps.setInt(1, id);
			ps.setFloat(2, interest);
			ps.setDate(3, DBFunctions.convertToSqlDate(dt));
			ps.setInt(4, entryBy);
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
}
