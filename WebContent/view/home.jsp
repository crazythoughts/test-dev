<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:choose>
<c:when test="${sessionScope.loggedIn !=true }">
	<c:redirect url="../index.jsp"/>
</c:when>
</c:choose>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/KJJCSoft/view/css/style.css" type="text/css"/>
<link href="/KJJCSoft/view/fonts/font-awesome/css/font-awesome.css" type="text/css" rel="stylesheet">
<title>KJJCSoft</title>
</head>
<body>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<div class="container">
	<div style="background : white; width : 100 %" >
		<div style="width : 15%;">
			KJJCSoft
		</div>
		<div style="width :85%;">
			<a href="/KJJCSoft/view/home.jsp"><img alt="User profile picture" src="/KJJCSoft/upload/${sessionScope.Userinfo.getEmployeePhotoPath()}" class="home-img"></a>
		</div>
	</div>
	<div class="sidebar f-left clearfix">
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
						<li><a href="/KJJCSoft/view/customer_registration.jsp">Manage Customer</a></li>
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
					<li>Reports</li>
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
						<li><a href="/KJJCSoft/view/customer_registration.jsp">Manage Customer</a></li>
						<li><a href="/KJJCSoft/com/kjjcsoft/controllers/FrontController">All Customers</a></li>
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
					<li>Reports</li>
				</ul>
			</c:otherwise>
		</c:choose>
		<form action="/KJJCSoft/com/kjjcsoft/controllers/Logout" method="post">
			<div class="submit">
			<input type="Submit" value="Logout" />
			</div>
		</form>
	</div>
		<div class="main-contain clearfix">
		<div class="main-contain-header clearfix">
			<div class="to-right">
			<ul class="stats">
                    <li class="green">
                        <i class="icon-briefcase"></i>
                        <div class="details">
                            <span class="big">Account Status</span>
                            <span>
                                <c:choose>
                                	<c:when test="${sessionScope.AdminLogin==true}">
                                		Admin
                                	</c:when>
                                	<c:otherwise>User</c:otherwise>
                                </c:choose>
                                </span>
                        </div>
                    </li>
                    <li class="orange">
                        <i class="icon-calendar"></i>
                        <div class="details">
                            <span class="big"><fmt:formatDate type="date" value="${now}" dateStyle="long"/></span>
                            <span><fmt:formatDate type="date" value="${now}" dateStyle="long" pattern="EEEE"/></span>
                        </div>
                    </li>
                </ul>
			</div>
                <h1 class="page-def">Dashboard</h1>
		</div>
		<ul class="nav-show">
			<li class="main-page">Dashboard<span class="divider">></span></li>
			<li class="active">Home</li>
		</ul>
		<div class="main-contain-content clearfix">
			<c:choose>
				<c:when test="${sessionScope.initLogin==true}">
					<div class="alert-info">
						Welcome to dashboard. You have logged in successfully
					</div>
					<c:remove var="initLogin" scope="session"/>
				</c:when>
				<c:otherwise>
					<div class="alert-info">
						Welcome to dashboard.
					</div>
				</c:otherwise>
			</c:choose>
		<div class="all-content">
			<div class="account-information">
			<p>User Information</p>
			<div class="profile-pic">
				<img alt="User profile picture" src="/KJJCSoft/upload/${sessionScope.Userinfo.getEmployeePhotoPath()}" class="success-profile-img">
			</div>
			<div class="user-info-container">
				<table class="user-info">
				<tr>
					<th>Name</th>
					<td><c:out value="${sessionScope.Userinfo.getName()}"/></td>
				</tr>
				<tr>
					<th>User Type</th>
					<td><c:out value="${sessionScope.Userinfo.getRole()}"/></td>
				</tr>
				<tr>
					<th>User Status</th>
					<td>
						<c:if test="${sessionScope.Userinfo.isUser_enabled() == true }">
						Active
						</c:if>
					</td>
				</tr>
				<tr>
					<th>Last Login</th>
					<td>
						<c:choose>
							<c:when test="${empty sessionScope.Userinfo.getLastLogin()}">
								<c:out value="${sessionScope.Userinfo.getCurrentLogin()}"/>
							</c:when>
							<c:otherwise>
								<c:out value="${sessionScope.Userinfo.getLastLogin()}"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>Current Login</th>
					<td>
						<c:out value="${sessionScope.Userinfo.getCurrentLogin()}"/>
					</td>
				</tr>
				</table>
			</div>
			</div>
		</div>
		</div>
		<jsp:include page="footer.jsp"/>
</div>
</div>
</body>
</html>