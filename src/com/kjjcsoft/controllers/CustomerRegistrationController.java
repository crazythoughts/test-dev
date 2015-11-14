package com.kjjcsoft.controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kjjcsoft.bean.CustomerBean;

/**
 * Servlet implementation class CustomerRegistrationController
 */
@WebServlet(description = "for registering the customer to the database", urlPatterns = { "/registration" })
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/customer_registration.jsp");
    	rd.forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerBean applicantInfo = new CustomerBean();
		if (request.getParameter("normField")!=null) {
			applicantInfo.setCustomerName(request.getParameter("fullname"));
			String age = request.getParameter("age");
			if
			applicantInfo.setCustomerAge(Int);
		}
	}
}
