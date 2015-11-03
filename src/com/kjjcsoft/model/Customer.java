/**
 * 
 */
package com.kjjcsoft.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.kjjcsoft.bean.CustomerBean;

/**
 * @author Seekraw
 *
 */
public class Customer {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public Customer(){
		con = null;
		ps = null;
		rs = null;
	}
	public boolean registerCustomer(CustomerBean paramIn){
		boolean customerCreated = false;
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("INSERT into tbl_customer (customer_name, customer_age, customer_gender, customer_dob, customer_nationality, customer_citizenshipno, customer_perm_district, customer_perm_vdc_municipality, customer_perm_extrainfo, customer_temp_district, customer_temp_vdc_municipality, customer_temp_extrainfo, customer_cell_number_first, customer_cell_number_second, customer_landline, customer_email, customer_marital_status, customer_spouse_name, customer_occupation, customer_father_name, customer_grandfather_name, customer_father_in_law_name, nominee_name, nominee_perm_district, nominee_perm_vdc_municipality, nominee_perm_extrainfo, nominee_temp_district, nominee_temp_vdc_municipality, nominee_temp_extrainfo, nominee_cell_number_first, nominee_cell_number_second, nominee_landline, nominee_email, guardian_name, guardian_relation, guardian_perm_district, guardian_perm_vdc_municipality, guardian_perm_extrainfo, guardian_temp_district, guardian_temp_vdc_municipality, guardian_temp_extrainfo, guardian_cell_number_one, guardian_cell_number_second, guardian_landline, guardian_email, customer_photo, customer_thumb_print, customer_joined_date, customer_refferedby, entry_by) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
			ps.setString(1, paramIn.getCustomerName());
			ps.setInt(2, paramIn.getCustomerAge());
			ps.setString(3, paramIn.getGender());
			ps.setDate(4, DBFunctions.convertToSqlDate(paramIn.getDob()));
			ps.setString(5, paramIn.getNationality());
			ps.setString(6, paramIn.getCitizenShipNo());
			ps.setString(7, paramIn.getPermDistrict());
			ps.setString(8, paramIn.getPermVdcMunicipality());
			ps.setString(9, paramIn.getPermExtrainfo());
			ps.setString(10, paramIn.getTempDistrict());
			ps.setString(11, paramIn.getTempVdcMunicipality());
			ps.setString(12, paramIn.getTempExtrainfo());
			ps.setString(13, paramIn.getCellNumberFirst());
			ps.setString(14, paramIn.getCellNumberSecond());
			ps.setString(15, paramIn.getLandLine());
			ps.setString(16, paramIn.getEmailId());
			ps.setString(17, paramIn.getMaritalStatus());
			ps.setString(18, paramIn.getSpouseName());
			ps.setString(19, paramIn.getOccupation());
			ps.setString(20, paramIn.getFathersName());
			ps.setString(21, paramIn.getGrandFathersName());
			ps.setString(22, paramIn.getFatherInLawsName());
			ps.setString(23, paramIn.getNomineesName());
			ps.setString(24, paramIn.getnPermDistrict());
			ps.setString(25, paramIn.getnPermVdcMunicipality());
			ps.setString(26, paramIn.getnPermExtraInfo());
			ps.setString(27, paramIn.getnTempDistrict());
			ps.setString(28, paramIn.getnTempVdcMunicipality());
			ps.setString(29, paramIn.getnTempExtraInfo());
			ps.setString(30, paramIn.getnCellNumberFirst());
			ps.setString(31, paramIn.getnCellNumberSecond());
			ps.setString(32, paramIn.getnLandLine());
			ps.setString(33, paramIn.getnEmailId());
			ps.setString(34, paramIn.getGuardianName());
			ps.setString(35, paramIn.getgRelation());
			ps.setString(36, paramIn.getgPermDistrict());
			ps.setString(37, paramIn.getgPermVdcMunicipality());
			ps.setString(38, paramIn.getgPermExtraInfo());
			ps.setString(39, paramIn.getgTempDistrict());
			ps.setString(40, paramIn.getgTempVdcMunicipality());
			ps.setString(41, paramIn.getgTempExtraInfo());
			ps.setString(42, paramIn.getgCellNumberFirst());
			ps.setString(43, paramIn.getgCellNumberSecond());
			ps.setString(44, paramIn.getgLandLine());
			ps.setString(45, paramIn.getgEmailId());
			ps.setString(46, paramIn.getPhotoPath());
			ps.setString(47, paramIn.getFinderPrintPath());
			ps.setDate(48, DBFunctions.convertToSqlDate(paramIn.getjDate()));
			ps.setString(49, paramIn.getRefferedBy());
			ps.setInt(50, paramIn.getEntryBy()	);
			ps.executeUpdate();
			customerCreated = true;
		}catch (SQLException ex) {
			customerCreated = false;
			System.out.println(ex);
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
			return customerCreated;
	}
	public boolean createAccount(int id, float interest, int entryBy){
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
	public CustomerBean lastInsertion(){
		CustomerBean lastInsertedCustomer= new CustomerBean();
		try {
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("SELECT * FROM tbl_customer ORDER BY customer_id DESC LIMIT 1");
			rs=ps.executeQuery();
			if (rs.next()) {
				lastInsertedCustomer.setCustomerId(rs.getInt("customer_id"));
				lastInsertedCustomer.setCustomerName(rs.getString("customer_name"));
				lastInsertedCustomer.setCustomerAge(rs.getInt("customer_age"));
				lastInsertedCustomer.setGender(rs.getString("customer_gender"));
				lastInsertedCustomer.setDob(rs.getDate("customer_dob"));
				lastInsertedCustomer.setNationality(rs.getString("customer_nationality"));
				lastInsertedCustomer.setCitizenShipNo(rs.getString("customer_citizenshipno"));
				lastInsertedCustomer.setPermDistrict(rs.getString("customer_perm_district"));
				lastInsertedCustomer.setPermVdcMunicipality(rs.getString("customer_perm_vdc_municipality"));
				lastInsertedCustomer.setPermExtrainfo(rs.getString("customer_perm_extrainfo"));
				lastInsertedCustomer.setTempDistrict(rs.getString("customer_temp_district"));
				lastInsertedCustomer.setTempVdcMunicipality(rs.getString("customer_temp_vdc_municipality"));
				lastInsertedCustomer.setTempExtrainfo(rs.getString("customer_temp_extrainfo"));
				lastInsertedCustomer.setCellNumberFirst(rs.getString("customer_cell_number_first"));
				lastInsertedCustomer.setCellNumberSecond(rs.getString("customer_cell_number_second"));
				lastInsertedCustomer.setLandLine(rs.getString("customer_landline"));
				lastInsertedCustomer.setEmailId(rs.getString("customer_email"));
				lastInsertedCustomer.setMaritalStatus(rs.getString("customer_marital_status"));
				lastInsertedCustomer.setSpouseName(rs.getString("customer_spouse_name"));
				lastInsertedCustomer.setOccupation(rs.getString("customer_occupation"));
				lastInsertedCustomer.setFathersName(rs.getString("customer_father_name"));
				lastInsertedCustomer.setGrandFathersName(rs.getString("customer_grandfather_name"));
				lastInsertedCustomer.setFatherInLawsName(rs.getString("customer_father_in_law_name"));
				lastInsertedCustomer.setNomineesName(rs.getString("nominee_name"));
				lastInsertedCustomer.setnPermDistrict(rs.getString("nominee_perm_district"));
				lastInsertedCustomer.setnPermVdcMunicipality(rs.getString("nominee_perm_vdc_municipality"));
				lastInsertedCustomer.setnPermExtraInfo(rs.getString("nominee_perm_extrainfo"));
				lastInsertedCustomer.setnTempDistrict(rs.getString("nominee_temp_district"));
				lastInsertedCustomer.setnTempVdcMunicipality(rs.getString("nominee_temp_vdc_municipality"));
				lastInsertedCustomer.setnTempExtraInfo(rs.getString("nominee_temp_extrainfo"));
				lastInsertedCustomer.setnCellNumberFirst(rs.getString("nominee_cell_number_first"));
				lastInsertedCustomer.setnCellNumberSecond(rs.getString("nominee_cell_number_second"));
				lastInsertedCustomer.setnLandLine(rs.getString("nominee_landline"));
				lastInsertedCustomer.setnEmailId(rs.getString("nominee_email"));
				lastInsertedCustomer.setGuardianName(rs.getString("guardian_name"));
				lastInsertedCustomer.setgRelation(rs.getString("guardian_relation"));
				lastInsertedCustomer.setgPermDistrict(rs.getString("guardian_perm_district"));
				lastInsertedCustomer.setgPermVdcMunicipality(rs.getString("guardian_perm_vdc_municipality"));
				lastInsertedCustomer.setgPermExtraInfo(rs.getString("guardian_perm_extrainfo"));
				lastInsertedCustomer.setgTempDistrict(rs.getString("guardian_temp_district"));
				lastInsertedCustomer.setgTempVdcMunicipality(rs.getString("guardian_temp_vdc_municipality"));
				lastInsertedCustomer.setgTempExtraInfo(rs.getString("guardian_temp_extrainfo"));
				lastInsertedCustomer.setgCellNumberFirst(rs.getString("guardian_cell_number_one"));
				lastInsertedCustomer.setgCellNumberSecond(rs.getString("guardian_cell_number_second"));
				lastInsertedCustomer.setgLandLine(rs.getString("guardian_landline"));
				lastInsertedCustomer.setgEmailId(rs.getString("guardian_email"));
				lastInsertedCustomer.setPhotoPath(rs.getString("customer_photo"));
				lastInsertedCustomer.setFinderPrintPath(rs.getString("customer_thumb_print"));
				lastInsertedCustomer.setjDate(rs.getDate("customer_joined_date"));
				lastInsertedCustomer.setRefferedBy(rs.getString("customer_refferedby"));
				lastInsertedCustomer.setEntryBy(rs.getInt("entry_by"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lastInsertedCustomer;
	}
}
