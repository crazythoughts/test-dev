<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="sidebar f-left clearfix">
<div class="company-logo">
	<img src="/KJJCSoft/view/images/camera-lens-logo.jpg" id="logo"/>
</div>
<div class="nav-option">
	<c:choose>
		<c:when test="${sessionScope.AdminLogin==true}">
			<ul>
				<li>Dashboard
					<ul>
						<li><a href="/KJJCSoft/view/home.jsp">Main</a></li>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/AccountInformation">My Account</a></li>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/users">Users</a></li>
					</ul>
				</li>
				<li>Employee</li>
				<li>Customer
					<ul>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/overview">Manage Customer</a></li>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/customers">All Customers</a></li>
					</ul>
				</li>
				<li>Accounts
					<ul>
						<li>Manage Accounts</li>
						<li>Saving Accounts</li>
						<li>Loan Accounts</li>
					</ul>
				</li>
				<li>Transactions
					<ul>
						<li>Collector</li>
						<li>Office</li>
					</ul>
				</li>
				<li>Reports
					<ul>
						<li>EMI</li>
						<li>Account Statement</li>
					</ul>
				</li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				<li>Dashboard
					<ul>
						<li><a href="/KJJCSoft/view/home.jsp">Main</a></li>
					</ul>
				</li>
				<li>Employee</li>
				<li>Customer
					<ul>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/overview">Manage Customer</a></li>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/customers">All Customers</a></li>
					</ul>
				</li>
				<li>Accounts
					<ul>
						<li>Manage Accounts</li>
						<li>Saving Accounts</li>
						<li>Loan Accounts</li>
					</ul>
				</li>
				<li>Transactions
					<ul>
						<li>Collector</li>
						<li>Office</li>
					</ul>
				</li>
				<li>Reports
					<ul>
						<li>EMI</li>
						<li>Account Statement</li>
					</ul>
				</li>
			</ul>
		</c:otherwise>
	</c:choose>
</div>
<div class="logout-button">
	<form action="/KJJCSoft/com/kjjcsoft/controllers/Logout" method="post">
		<div class="submit">
			<input type="Submit" value="Logout" />
		</div>
	</form>
</div>
</div>