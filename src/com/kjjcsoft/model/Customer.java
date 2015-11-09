/**
 * 
 */
package com.kjjcsoft.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
			ps=con.prepareStatement("INSERT into tbl_customer (customer_name, customer_age, customer_gender, customer_dob, customer_nationality, customer_citizenshipno, customer_perm_district, customer_perm_vdc_municipality, customer_perm_extrainfo, customer_temp_district, customer_temp_vdc_municipality, customer_temp_extrainfo, customer_cell_number_first, customer_cell_number_second, customer_landline, customer_email, customer_marital_status, customer_spouse_name, customer_occupation, customer_father_name, customer_grandfather_name, customer_father_in_law_name, nominee_name, nominee_relation, nominee_perm_district, nominee_perm_vdc_municipality, nominee_perm_extrainfo, nominee_temp_district, nominee_temp_vdc_municipality, nominee_temp_extrainfo, nominee_cell_number_first, nominee_cell_number_second, nominee_landline, nominee_email, guardian_name, guardian_relation, guardian_perm_district, guardian_perm_vdc_municipality, guardian_perm_extrainfo, guardian_temp_district, guardian_temp_vdc_municipality, guardian_temp_extrainfo, guardian_cell_number_one, guardian_cell_number_second, guardian_landline, guardian_email, customer_photo, customer_thumb_print, customer_joined_date, customer_refferedby, customer_approved_by, entry_by) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
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
			ps.setString(24, paramIn.getNomineeRelation());
			ps.setString(25, paramIn.getnPermDistrict());
			ps.setString(26, paramIn.getnPermVdcMunicipality());
			ps.setString(27, paramIn.getnPermExtraInfo());
			ps.setString(28, paramIn.getnTempDistrict());
			ps.setString(29, paramIn.getnTempVdcMunicipality());
			ps.setString(30, paramIn.getnTempExtraInfo());
			ps.setString(31, paramIn.getnCellNumberFirst());
			ps.setString(32, paramIn.getnCellNumberSecond());
			ps.setString(33, paramIn.getnLandLine());
			ps.setString(34, paramIn.getnEmailId());
			ps.setString(35, paramIn.getGuardianName());
			ps.setString(36, paramIn.getgRelation());
			ps.setString(37, paramIn.getgPermDistrict());
			ps.setString(38, paramIn.getgPermVdcMunicipality());
			ps.setString(39, paramIn.getgPermExtraInfo());
			ps.setString(40, paramIn.getgTempDistrict());
			ps.setString(41, paramIn.getgTempVdcMunicipality());
			ps.setString(42, paramIn.getgTempExtraInfo());
			ps.setString(43, paramIn.getgCellNumberFirst());
			ps.setString(44, paramIn.getgCellNumberSecond());
			ps.setString(45, paramIn.getgLandLine());
			ps.setString(46, paramIn.getgEmailId());
			ps.setString(47, paramIn.getPhotoPath());
			ps.setString(48, paramIn.getFinderPrintPath());
			ps.setDate(49, DBFunctions.convertToSqlDate(paramIn.getjDate()));
			ps.setString(50, paramIn.getRefferedBy());
			ps.setString(51, paramIn.getApprovedBy());
			ps.setInt(52, paramIn.getEntryBy()	);
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
				lastInsertedCustomer.setNomineeRelation(rs.getString("nominee_relation"));
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
				lastInsertedCustomer.setApprovedBy(rs.getString("customer_approved_by"));
				lastInsertedCustomer.setEntryBy(rs.getInt("entry_by"));
			} else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lastInsertedCustomer;
	}
	public String checkIfExists(int ID){
		String retMsg;
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("SELECT customer_name FROM tbl_customer WHERE customer_id=?");
			ps.setInt(1, ID);
			rs=ps.executeQuery();
			if (rs.next()) {
				retMsg=rs.getString("customer_name");
			} else {
				retMsg="No Match";
			}
		} catch (SQLException ex){
			retMsg="error";
			ex.printStackTrace();
		} finally{
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
		return retMsg;
	}
	
	public  ArrayList<CustomerBean> getAllUserList(){
		ArrayList<CustomerBean> list = new ArrayList<CustomerBean>();
		try{
			con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("SELECT customer_id, customer_name, customer_age, customer_gender, customer_citizenshipno, customer_perm_vdc_municipality, customer_cell_number_first, customer_marital_status, customer_occupation, customer_father_name, customer_joined_date, customer_refferedby, entry_by FROM tbl_customer");
			rs = ps.executeQuery();
			while (rs.next()) {
				CustomerBean storeInfo = new CustomerBean();
				storeInfo.setCustomerId(rs.getInt("customer_id"));
				storeInfo.setCustomerName(rs.getString("customer_name"));
				storeInfo.setCustomerAge(rs.getInt("customer_age"));
				storeInfo.setGender(rs.getString("customer_gender"));
				storeInfo.setCitizenShipNo(rs.getString("customer_citizenshipno"));
				storeInfo.setPermVdcMunicipality(rs.getString("customer_perm_vdc_municipality"));
				storeInfo.setCellNumberFirst(rs.getString("customer_cell_number_first"));
				storeInfo.setMaritalStatus(rs.getString("customer_marital_status"));
				storeInfo.setOccupation(rs.getString("customer_occupation"));
				storeInfo.setFathersName(rs.getString("customer_father_name"));
				storeInfo.setjDate(rs.getDate("customer_joined_date"));
				storeInfo.setRefferedBy(rs.getString("customer_refferedby"));
				storeInfo.setEntryBy(rs.getInt("entry_by"));
				list.add(storeInfo);
			}
		} catch(SQLException ex) {
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
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
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
