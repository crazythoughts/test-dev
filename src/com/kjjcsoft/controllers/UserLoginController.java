package com.kjjcsoft.controllers;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kjjcsoft.model.AuthenticateUser;
import com.kjjcsoft.model.DBFunctions;
import com.kjjcsoft.bean.RetrivedUserBean;
import com.kjjcsoft.bean.UserBean;

/**
 * Servlet implementation class UserLoginController
 */
@WebServlet(description = "Login Page Controller", urlPatterns = { "/UserLogin" })
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public UserLoginController(){
		super();
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession(true);
		boolean ret_result=false;
		AuthenticateUser au= new AuthenticateUser();
		UserBean usr= new UserBean();
		DBFunctions retrive_user= new DBFunctions();
		RetrivedUserBean r_user=new RetrivedUserBean();
		usr.setUsername(request.getParameter("username"));
		usr.setPassword(request.getParameter("password"));
		try {
			ret_result=au.authenticate(usr);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		if (ret_result==false) {
			session.setAttribute("error", true);
			RequestDispatcher rd = request.getRequestDispatcher("../../../index.jsp");
            rd.forward(request, response);
		} else {
			r_user=retrive_user.getUserInfo(usr);
			session.setAttribute("Userinfo",r_user );
			if (r_user.getRole().equals("Administrator")) {
				session.setAttribute("loggedIn", true);
				session.setAttribute("AdminLogin", true);
				System.out.println(session.getAttribute("AdminLogin"));
			} else {
				session.setAttribute("AdminLogin", false);
			}
			response.sendRedirect("../../../view/success.jsp");
		}		
	}

}
