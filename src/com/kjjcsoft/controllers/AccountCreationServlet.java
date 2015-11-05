package com.kjjcsoft.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kjjcsoft.bean.AccountBean;
import com.kjjcsoft.model.Customer;

/**
 * Servlet implementation class AccountCreationServlet
 */
@WebServlet(description = "for account creation ie opening an account", urlPatterns = { "/AccountCreation" })
public class AccountCreationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountCreationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountBean creationInfo = new AccountBean();
		Customer checkCustomer = new Customer();
		String cNamefDb;
		RequestDispatcher rd = request.getRequestDispatcher("/view/open_ds_account.jsp");
		if (request.getParameter("check") != null) {
			cNamefDb = checkCustomer.checkIfExists(Integer.parseInt(request.getParameter("customer_id")));
			request.setAttribute("cName", cNamefDb);
			rd.forward(request, response);
		}
		if (request.getParameter("create") != null) {
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
				creationInfo.setInterestRate(8.5f);
			} else {
				creationInfo.setInterestRate(Float.parseFloat(request.getParameter("interest_rate")));
			}
			if (request.getParameter("approved_by").equals("")) {
				rd.forward(request, response);
			} else {
				creationInfo.setApprovedBy(request.getParameter("approved_by"));
			}
		}
	}
}
