/**
 * 
 */
package com.kjjcsoft.model;
import java.sql.*;
import com.kjjcsoft.bean.CustomerBean;
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
	public void createCustomer(CustomerBean customer){
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("INSERT into tbl_customer (customer_name, customer_age, customer_gender, customer_dob, customer_perm_district, customer_perm_vdc_municipality, customer_perm_extrainfo, customer_temp_district, customer_temp_vdc_municipality, customer_temp_extrainfo, customer_cell_number_first, customer_cell_number_second, customer_landline, customer_email, customer_marital_status, customer_spouse_name, customer_occupation, customer_father_name, customer_grandfather_name, customer_father_in_law_name, nominee_name, nominee_perm_district, nominee_perm_vdc_municipality, nominee_perm_extrainfo, nominee_temp_district, nominee_temp_vdc_municipality, nominee_temp_extrainfo, nominee_cell_number_first, nominee_cell_number_second, nominee_landline, nominee_email, guardian_name, guardian_relation, guardian_perm_district, guardian_perm_vdc_municipality, guardian_perm_extrainfo, guardian_temp_district, guardian_temp_vdc_municipality, guardian_temp_extrainfo, guardian_cell_number_one, guardian_cell_number_second, guardian_landline, guardian_email, customer_photo, customer_thumb_print, customer_joined_date, customer_refferedby, entry_by) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
			ps.setString(1, customer.getCustomerName());
			ps.setInt(2, customer.getCustomerAge());
			ps.setString(3, customer.getGender());
			ps.setDate(4, convertToSqlDate(customer.getDob()));
			ps.setString(5, customer.getPermDistrict());
			ps.setString(6, customer.getPermVdcMunicipality());
			ps.setString(7, customer.getPermExtrainfo());
			ps.setString(8, customer.getTempDistrict());
			ps.setString(9, customer.getTempVdcMunicipality());
			ps.setString(10, customer.getTempExtrainfo());
			ps.setString(11, customer.getCellNumberFirst());
			ps.setString(12, customer.getCellNumberSecond());
			ps.setString(13, customer.getLandLine());
			ps.setString(14, customer.getEmailId());
			ps.setString(15, customer.getMaritalStatus());
			ps.setString(16, customer.getSpouseName());
			ps.setString(17, customer.getOccupation());
			ps.setString(18, customer.getFathersName());
			ps.setString(19, customer.getGrandFathersName());
			ps.setString(20, customer.getFatherInLawsName());
			ps.setString(21, customer.getNomineesName());
			ps.setString(22, customer.getnPermDistrict());
			ps.setString(23, customer.getnPermVdcMunicipality());
			ps.setString(24, customer.getnPermExtraInfo());
			ps.setString(25, customer.getnTempDistrict());
			ps.setString(26, customer.getnTempVdcMunicipality());
			ps.setString(27, customer.getnTempExtraInfo());
			ps.setString(28, customer.getnCellNumberFirst());
			ps.setString(29, customer.getnCellNumberSecond());
			ps.setString(30, customer.getnLandLine());
			ps.setString(31, customer.getnEmailId());
			ps.setString(32, customer.getGuardianName());
			ps.setString(33, customer.getgRelation());
			ps.setString(34, customer.getgPermDistrict());
			ps.setString(35, customer.getgPermVdcMunicipality());
			ps.setString(36, customer.getgPermExtraInfo());
			ps.setString(37, customer.getgTempDistrict());
			ps.setString(38, customer.getgTempVdcMunicipality());
			ps.setString(39, customer.getgTempExtraInfo());
			ps.setString(40, customer.getgCellNumberFirst());
			ps.setString(41, customer.getgCellNumberSecond());
			ps.setString(42, customer.getgLandLine());
			ps.setString(43, customer.getgEmailId());
			ps.setString(44, customer.getPhotoPath());
			ps.setString(45, customer.getFinderPrintPath());
			ps.setDate(46, convertToSqlDate(customer.getjDate()));
			ps.setString(47, customer.getRefferedBy());
			ps.setInt(48, customer.getEntryBy()	);
			ps.executeUpdate();
		}catch(SQLException ex){
			System.out.println(ex);
		}
		finally{
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
	}
	public static java.sql.Date convertToSqlDate (java.util.Date inDate){
		java.sql.Date conDate= new java.sql.Date(inDate.getTime());
		return conDate;
	}
}
