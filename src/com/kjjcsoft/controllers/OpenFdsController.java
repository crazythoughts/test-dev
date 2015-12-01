package com.kjjcsoft.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kjjcsoft.bean.AccountBean;
import com.kjjcsoft.bean.RetrivedUserBean;
import com.kjjcsoft.model.Accounts;
import com.kjjcsoft.model.Customer;

/**
 * Servlet implementation class OpenFdsAccountServlet
 */
@WebServlet(description = "fixed deposit saving account opening", urlPatterns = { "/openfixed" })
public class OpenFdsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OpenFdsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/openFDS.jsp");
    	rd.forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountBean creationInfo = new AccountBean();
		Accounts fdsAccount = new Accounts();
		RetrivedUserBean ses_usr= new RetrivedUserBean();
		ses_usr= (RetrivedUserBean)request.getSession().getAttribute("Userinfo");
		Customer checkCustomer = new Customer();
		String cNamefDb;
		RequestDispatcher rd = request.getRequestDispatcher("/view/openFDS.jsp.jsp");
		if (request.getParameter("check")!=null) {
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
		if (request.getParameter("create")!=null) {
			if (request.getParameter("customer_id").equals("")) {
				rd.forward(request, response);
				return;
			} else {
				creationInfo.setCustomerId(Integer.parseInt(request.getParameter("customer_id")));
			}
			if (request.getParameter("interest_rate").equals("")) {
				creationInfo.setInterestRate(10.5f);
			} else {
				creationInfo.setInterestRate(Float.parseFloat(request.getParameter("interest_rate")));
			}
			if (request.getParameter("fd_amount").equals("")) {
				rd.forward(request, response);
				return;
			} else {
				creationInfo.setFixedDepositAmount(Double.parseDouble(request.getParameter("fd_amount")));
			}
			if (request.getParameter("maturity_period").equals("")) {
				rd.forward(request, response);
				return;
			} else {
				creationInfo.setYears(Integer.parseInt(request.getParameter("maturity_period")));
			}
			if (request.getParameter("account_type").equals("")) {
				rd.forward(request, response);
				return;
			} else {
				creationInfo.setAccountType(request.getParameter("account_type"));
			}
			if (request.getParameter("approved_by").equals("")) {
				rd.forward(request, response);
				return;
			} else {
				creationInfo.setApprovedBy(request.getParameter("approved_by"));
			}
			creationInfo.setEntryBy(ses_usr.getUser_id());
			request.getSession().removeAttribute("Id");
			if (fdsAccount.createFdsAccount(creationInfo)) {
				AccountBean recBean= fdsAccount.retLastFdsAcCreated(creationInfo.getCustomerId());
				request.getSession().setAttribute("fdsAcInfo", recBean);
				response.sendRedirect("/KJJCSoft/view/FDScreated.jsp");
			} else {

			}
		}
		if (request.getParameter("cancel")!=null) {
			response.sendRedirect("/KJJCSoft/com/kjjcsoft/controllers/savingdetails");
			return;
		}
	}

}
