package com.kjjcsoft.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kjjcsoft.bean.AccountBean;
import com.kjjcsoft.bean.LoanAccountBean;
import com.kjjcsoft.bean.RetrivedUserBean;
import com.kjjcsoft.model.Customer;
import com.kjjcsoft.model.LoanAccounts;

/**
 * Servlet implementation class OpenBlAccountServlet
 */
@WebServlet("/OpenBlAccountServlet")
public class OpenBlAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OpenBlAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoanAccountBean creationInfo = new LoanAccountBean();
		Customer checkCustomer = new Customer();
		String cNamefDb;
		LoanAccounts blAccount = new LoanAccounts();
		RetrivedUserBean ses_usr= new RetrivedUserBean();
		ses_usr=(RetrivedUserBean)request.getSession().getAttribute("Userinfo");
		RequestDispatcher rd = request.getRequestDispatcher("/view/open_bl_account.jsp");
		if (request.getParameter("check") != null) {
			cNamefDb = checkCustomer.checkIfExists(Integer.parseInt(request.getParameter("customer_id")));
			if (cNamefDb.equals("No Match")) {
				request.setAttribute("customerError", "*Given Customer ID doesnot exists in the system");
				rd.forward(request, response);
			} else if(cNamefDb.equals("error")) {
				request.setAttribute("Error", "Something went wrong");
				rd.forward(request, response);
			} else {
				request.setAttribute("cName", cNamefDb);
				request.getSession().setAttribute("cName", cNamefDb);
				rd.forward(request, response);
			}
		}
		if(request.getParameter("create")!=null){
			if (request.getParameter("id").equals("")) {
				rd.forward(request, response);
			} else {
				creationInfo.setCustomerId(Integer.parseInt(request.getParameter("id")));
			}
			if (request.getParameter("account_type").equals("")) {
				rd.forward(request, response);
			} else {
				creationInfo.setAccountType(request.getParameter("account_type"));
			}
			if (request.getParameter("interest_rate").equals("")) {
				creationInfo.setInterestRate(15.5f);
			} else {
				creationInfo.setInterestRate(Float.parseFloat(request.getParameter("interest_rate")));
			}
			if (request.getParameter("approved_by").equals("")) {
				rd.forward(request, response);
			} else {
				creationInfo.setApprovedBy(request.getParameter("approved_by"));
			}
			if(request.getParameter("approved_amount").equals("")){
				rd.forward(request, response);
			}else{
				creationInfo.setApprovedAmount(request.getParameter("approved_amount"));
			}
			creationInfo.setEntryBy(ses_usr.getUser_id());
			if(blAccount.createBlAccount(creationInfo)){
				AccountBean recBean=blAccount.retLastBlAcCreated(creationInfo.getCustomerId());
				/*if (!request.getParameter("starting_amount".equals(""))) {
					
				}*/
				request.getSession().setAttribute("blAcInfo", recBean);
				response.sendRedirect("/KJJCSoft/view/bl_ac_created.jsp");
			}
			
		}
	}
}
