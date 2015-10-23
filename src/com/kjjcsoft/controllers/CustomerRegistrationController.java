package com.kjjcsoft.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kjjcsoft.bean.CustomerBean;

/**
 * Servlet implementation class CustomerRegistrationController
 */
@WebServlet(description = "for registering the customer to the database", urlPatterns = { "/CustomerRegistration" })
public class CustomerRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerBean customer=new CustomerBean();
		SimpleDateFormat sdf= new SimpleDateFormat("YYYY/MM/dd");
		customer.setCustomerName(request.getParameter("fullname"));
		try {
			customer.setDob(sdf.parse(request.getParameter("dob")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		customer.setGender(request.getParameter("sex"));
		customer.setMaritalStatus(request.getParameter("marital_status"));
		if (customer.getMaritalStatus()=="Married") {
			customer.setSpouseName(request.getParameter("spouse_name"));			
		}
		customer.setOccupation(request.getParameter("occupation"));
		if (request.getParameter("cellnumber_first")!=null) {
			customer.setCellNumberFirst(request.getParameter("cellnumber_first"));			
		}
		if (request.getParameter("cellnumber_second")!=null) {
			customer.setCellNumberSecond(request.getParameter("cellnumber_second"));
		}
		if (request.getParameter("landline")!=null) {
			customer.setLandLine(request.getParameter("landline"));
		}
		customer.setPermDistrict(request.getParameter("perm_dist"));
		customer.setPermVdcMunicipality(request.getParameter("perm_vdc_mp"));
		if (request.getParameter("perm_extra")!=null) {
			customer.setPermExtrainfo(request.getParameter("perm_extra"));
		}
		customer.setTempDistrict(request.getParameter("temp_dist"));
		customer.setTempVdcMunicipality(request.getParameter("temp_vdc_mp"));
		if (request.getParameter("temp_extra")!=null) {
			customer.setTempExtrainfo(request.getParameter("temp_extra"));
		}
		customer.setFathersName(request.getParameter("fathers_name"));
		if (request.getParameter("grandfathers_name")!=null) {
			customer.setFathersName(request.getParameter("grandfathers_name"));
		}
		if (request.getParameter("father_in_law_name")!=null) {
			customer.setFatherInLawsName(request.getParameter("father_in_law_name"));
		}
		customer.setNomineesName(request.getParameter("nominee_name"));
		if (request.getParameter("nominee_cell_fist")!=null) {
			customer.setnCellNumberFirst(request.getParameter("nominee_cell_first"));
		}
		if (request.getParameter("nominee_cell_second")!=null) {
			customer.setnCellNumberSecond(request.getParameter("nominee_cell_second"));
		}
		if (request.getParameter("nominee_landline")!=null) {
			customer.setnLandLine(request.getParameter("nominee_landline"));
		}
		if (request.getParameter("nominee_email")!=null) {
			customer.setnEmailId(request.getParameter("nominee_email"));
		}
		customer.setnPermDistrict(request.getParameter("n_perm_dist"));
		customer.setnPermVdcMunicipality(request.getParameter("n_perm_vdc_mp"));
		if (request.getParameter("n_perm_extra")!=null) {
			customer.setnPermExtraInfo(request.getParameter("n_perm_extra"));
		}
		customer.setnTempDistrict(request.getParameter("n_temp_dist"));
		customer.setnTempVdcMunicipality(request.getParameter("n_temp_vdc_mp"));
		if (request.getParameter("n_temp_extra")!=null) {
			customer.setnTempExtraInfo(request.getParameter("n_temp_extra"));
		}
		if (customer.getCustomerAge()<16) {
			customer.setGuardianName(request.getParameter("guardian_name"));
			customer.setgRelation(request.getParameter("guardian_relation"));
			if (request.getParameter("guardian_cell_first")!=null) {
				customer.setgCellNumberFirst(request.getParameter("guardian_cell_first"));
			}
			if (request.getParameter("guardian_cell_second")!=null) {
				customer.setgCellNumberSecond(request.getParameter("guardian_cell_second"));
			}
			if (request.getParameter("guardian_landline")!=null) {
				customer.setgLandLine(request.getParameter("guardian_landline"));
			}
			if (request.getParameter("guardian_email")!=null) {
				customer.setgEmailId(request.getParameter("guardian_email"));
			}
			customer.setgPermDistrict(request.getParameter("g_perm_dist"));
			customer.setgPermVdcMunicipality(request.getParameter("g_perm_vdc_mp"));
			if (request.getParameter("g_perm_extra")!=null) {
				customer.setgPermExtraInfo(request.getParameter("g_perm_extra"));
			}
			customer.setgTempDistrict(request.getParameter("g_temp_district"));
			customer.setgTempVdcMunicipality(request.getParameter("g_temp_vdc_mp"));
			if (request.getParameter("g_temp_extra")!=null) {
				customer.setgTempExtraInfo(request.getParameter("g_temp_extra"));
			}
		}
			
	}

}
